require 'rails_helper'

RSpec.describe "Bank Routing Number API", :type => :request do

  it "displays displays a json object with basic attributes" do
    bank = create(:bank, routing_number: "123456789", street_optional: nil, updated_routing_number: nil)
    expected = { name: bank.name,
                 routing_number: bank.routing_number,
                 record_type: bank.record_type,
                 phone_number: bank.phone_number,
                 address: {
                            street: bank.street,
                            city: bank.city,
                            state: bank.state,
                            zip_code: bank.zip_code
                 }

    }.to_json
    get "/banks/123456789"
    expect(response.body).to eq(expected)
  end

  it "displays displays a json object with a street_2 attribute if the said attribute on model is not null" do
    bank = create(:bank, routing_number: "123456789", updated_routing_number: nil)
    expected = { name: bank.name,
                 routing_number: bank.routing_number,
                 record_type: bank.record_type,
                 phone_number: bank.phone_number,
                 address: {
                            street: bank.street,
                            street_2: bank.street_optional,
                            city: bank.city,
                            state: bank.state,
                            zip_code: bank.zip_code
                 }

    }.to_json
    get "/banks/123456789"
    expect(response.body).to eq(expected)
  end

  it "displays displays a json object with an updated_routing_number attribute if the said attribute on model is not null" do
    bank = create(:bank, routing_number: "123456789", updated_routing_number: "987654321")
    expected = { name: bank.name,
                 routing_number: bank.routing_number,
                 record_type: bank.record_type,
                 phone_number: bank.phone_number,
                 address: {
                            street: bank.street,
                            street_2: bank.street_optional,
                            city: bank.city,
                            state: bank.state,
                            zip_code: bank.zip_code
                 },
                 updated_routing_number: bank.updated_routing_number

    }.to_json
    get "/banks/123456789"
    expect(response.body).to eq(expected)
  end

end