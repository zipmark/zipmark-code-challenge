require 'spec_helper'

describe ClearingHouseFormatter do
  it "should format as desired" do
    ch = ClearingHouse.create(name: "FEDERAL RESERVE BANK",
			      routing_number: "011000015",
			      record_type: "0",
			      phone_number: "8662345681")

    Address.create(street: "1000 PEACHTREE ST N.E.",
		   city: "ATLANTA",
		   state: "GA",
		   zip_code: "30309",
		   clearing_house_id: ch.id)

    ch_out = ClearingHouseFormatter.format(ch)

    expect(ch_out["name"]).to eq "FEDERAL RESERVE BANK"
    expect(ch_out["address"]["city"]).to eq "ATLANTA"
    expect(ch_out["created_at"]).to be_nil
  end


end
