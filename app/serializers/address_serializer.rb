class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :street_2, :city, :state, :zip_code
end
