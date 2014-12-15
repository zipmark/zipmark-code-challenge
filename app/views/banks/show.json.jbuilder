json.extract! @bank, :name, :routing_number, :phone_number
json.address do 
  json.extract! @bank.address, :line_1, :line_2, :city, :state, :zip_code
end