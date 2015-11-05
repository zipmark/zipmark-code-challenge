class BankSerializer < ActiveModel::Serializer
  attributes :id, :name, :routing_number, :record_type, :phone_number
  has_one :address
end
