require 'rails_helper'

RSpec.describe BanksController, :type => :controller do
  let(:bank) { create(:bank) }

  describe "#show" do
    subject { get :show, params.merge({format: :json}) }

    context "when viewing stored bank" do
      let(:params) { {id: bank.routing_number } }

      it "returns 200" do
        subject
        expect(response.status).to eq(200)
      end
    end
    context "when viewing non-existent bank" do
      let(:params) { {id: 666 } }

      it "returns 404" do
        subject
        expect(response.status).to eq(404)
      end
    end
  end
end
