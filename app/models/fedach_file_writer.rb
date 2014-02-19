class FedachFileWriter
  def self.create_clearing_house(params)
    clearing_house_attributes = params[:clearing_house]
    ch = ClearingHouse.find_or_create_by(clearing_house_attributes)
    address_attributes = params[:address].merge(clearing_house_id: ch.id)
    Address.find_or_create_by(address_attributes)
  end
end
