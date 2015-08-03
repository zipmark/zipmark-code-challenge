json.(@bank, :name, :routing_number, :record_type, :phone_number)
json.address do
  json.(@bank, :street, :street2, :city, :state, :zip_code)
end
