json.tel_num "#{@bank.tel_area_code}-#{@bank.tel_prefix}-#{@bank.tel_suffix}"
json.address do
  json.city @bank.city.split(" ").map { |el| el.downcase.capitalize}.join(" ")
  json.state @bank.state_code
  json.extract! @bank, :zipcode, :zipcode_ext
  json.street_address @bank.address
end
json.last_change_date @bank.last_change_date.to_s[0...10]
json.extract! @bank,
  :office_code,
  :frb_num,
  :record_type_code,
  :new_routing_num,
  :routing_num,
  :cust_name,
  :inst_status__code,
  :data_view_code
json.record_type ["Federal Reserve Bank", "Send items to customer routing number", "Send items to customer using new routing number field"][@bank.record_type_code]
