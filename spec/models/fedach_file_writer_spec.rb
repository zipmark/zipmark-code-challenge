require 'spec_helper'

describe FedachFileWriter do
  it "should write the database" do
    original_amount = ClearingHouse.count
    address_amount = Address.count

    clearing_house_hash = { name: "FEDERAL RESERVE BANK",
			    routing_number: "011000015",
			    record_type: "0",
			    phone_number: "8662345681" }

    address_hash = {street: "1000 PEACHTREE ST N.E.",
		    city: "ATLANTA",
		    state: "GA",
		    zip_code: "30309" }
    FedachFileWriter.create_clearing_house(clearing_house: clearing_house_hash, address: address_hash)


    clearing_house = ClearingHouse.first
    expect(clearing_house.name).to eq "FEDERAL RESERVE BANK"
    expect(clearing_house.routing_number).to eq "011000015"
    expect(clearing_house.record_type).to eq "0"
    expect(clearing_house.phone_number).to eq "8662345681"

    address = clearing_house.address
    expect(address.street).to eq "1000 PEACHTREE ST N.E."
    expect(address.city).to eq "ATLANTA"
    expect(address.state).to eq "GA"
    expect(address.zip_code).to eq "30309"
    expect(ClearingHouse.count).to eq (original_amount + 1)
    expect(Address.count).to eq (address_amount + 1)
  end
end
