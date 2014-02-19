require 'spec_helper'

describe FedachFileParser do
    let (:file_parser) { FedachFileParser.new("https://gist.github.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list") }

  it "should have a response body" do
    expect(file_parser.response_body).not_to be_nil
  end

  let(:line) { "011000015O0110000150020802000000000FEDERAL RESERVE BANK                1000 PEACHTREE ST N.E.              ATLANTA             GA303094470866234568111
	       "}
  it "creates  clearing house attributes" do
    attributes = file_parser.clearing_house_attributes(line)

    expect(attributes[:name]).to eq "FEDERAL RESERVE BANK"
    expect(attributes[:routing_number]).to eq "011000015"
    expect(attributes[:record_type]).to eq "0"
    expect(attributes[:phone_number]).to eq "8662345681"
  end

  it "creates address attributes" do
    address = file_parser.address_attributes(line)

    expect(address[:street]).to eq "1000 PEACHTREE ST N.E."
    expect(address[:city]).to eq "ATLANTA"
    expect(address[:state]).to eq "GA"
    expect(address[:zip_code]).to eq "30309"
  end

  let(:line2) {  "011110743B0110000151061010000000000THE CITIZENS NATIONAL BANK          182 MAIN ST, PO BOX 6002            PUTNAM              CT062600000860928792111
  " }
  it "creates address attributes" do
    address = file_parser.address_attributes(line2)

    expect(address[:street]).to eq "182 MAIN ST"
    expect(address[:street2]).to eq "PO BOX 6002"
    expect(address[:city]).to eq "PUTNAM"
    expect(address[:state]).to eq "CT"
    expect(address[:zip_code]).to eq "06260"
  end

  it "creates 100 clearing houses in the database" do
    original_amount = ClearingHouse.count
    address_amount = Address.count
    file_parser.find_or_create_clearing_houses

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
    expect(ClearingHouse.count).to eq (original_amount + 100)
    expect(Address.count).to eq (address_amount + 100)
  end
end
