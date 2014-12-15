require 'rails_helper'

RSpec.describe BanksController, type: :controller do

  describe "GET show" do
    it "returns http success" do
      bank = create(:bank)
      get :show, routing_number: bank.routing_number, format: :json
      expect(response).to be_success
    end
  end
end
