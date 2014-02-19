require 'spec_helper'

describe ClearingHousesController do

  it "should show a json of the clearing house" do

    ch = ClearingHouse.create(name: "FEDERAL RESERVE BANK",
			      routing_number: "011000015",
			      record_type: "0",
			      phone_number: "8662345681")

     Address.create(street: "1000 PEACHTREE ST N.E.",
		    city: "ATLANTA",
		    state: "GA",
		    zip_code: "30309",
		    clearing_house_id: ch.id)

    get :show, format: :json, routing_number: ch.routing_number
    expect(response.status).to eq 200
    expect(response.body).to include "FEDERAL RESERVE BANK"
    expect(response.body).to include "ATLANTA"
    expect(response.body).not_to include ch.created_at.to_s
  end

end
