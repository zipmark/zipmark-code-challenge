json.record_type @bank.record_type

json.extract! @bank,
  :cust_name,
  :routing_num,
  :tel_number,
  :street_address,
  :city,
  :state,
  :zipcode,
  :zipcode_ext,
  :record_type_code,
  :frb_num,
  :new_routing_num,
  :data_view_code,
  :office_code,
  :last_change_date,
  :inst_status__code
