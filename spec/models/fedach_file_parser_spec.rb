require 'spec_helper'

describe FedachFileParser do
    let (:file_parser) { FedachFileParser.new("https://gist.github.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list") }

  it "should have a response body" do
    expect(file_parser.response_body).not_to be_nil
  end

  let(:line) { "011000015O0110000150020802000000000FEDERAL RESERVE BANK                1000 PEACHTREE ST N.E.              ATLANTA             GA303094470866234568111
	       "}


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

  it "can make an hash for clearing house and address" do
    hash = file_parser.to_hash(line)
    attributes = hash[:clearing_house]
    address = hash[:address]

    expect(attributes[:name]).to eq "FEDERAL RESERVE BANK"
    expect(attributes[:routing_number]).to eq "011000015"
    expect(attributes[:record_type]).to eq "0"
    expect(attributes[:phone_number]).to eq "8662345681"

    expect(address[:street]).to eq "1000 PEACHTREE ST N.E."
    expect(address[:city]).to eq "ATLANTA"
    expect(address[:state]).to eq "GA"
    expect(address[:zip_code]).to eq "30309"
  end
end

