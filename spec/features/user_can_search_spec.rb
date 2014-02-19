require 'spec_helper'

describe "any user can search by routing number" do
  it "visiting the search page" do
    ch = ClearingHouse.create(name: "FEDERAL RESERVE BANK",
			      routing_number: "011000015",
			      record_type: "0",
			      phone_number: "8662345681")

     Address.create(street: "1000 PEACHTREE ST N.E.",
		    city: "ATLANTA",
		    state: "GA",
		    zip_code: "30309",
		    clearing_house_id: ch.id)

    visit root_path
    fill_in "Routing Number", with: ch.routing_number
    click_on "Search"
    expect(page).to have_content "#{ch.name}"
  end
end
