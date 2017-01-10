require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { build(:address) }

  describe "zip code validation" do 
    it "makes sure the zip code is 5 characters long" do 
      address.zip_code = '4444'
      address.save
      expect(
        address.errors[:zip_code].any? { |e| e =~ /should be 5 characters/ }
      ).to be(true)
    end

    it "makes sure the zip code consists of numeric characters" do 
      address.zip_code = 'alpha'
      address.save
      expect(
        address.errors[:zip_code].any? { |e| e =~ /is not a number/ }
      ).to be(true)
    end
  end

  describe "state validation" do 
    it "makes sure the state is two characters long" do 
      address.state = 'NYC'
      address.save
      expect(
        address.errors[:state].any? { |e| e =~ /should be 2 characters/ }
      ).to be(true)
    end
  end

  describe "#destroy" do 
    it "destroys itself and it's associated bank" do 
      bank = create(:bank)
      address = bank.address
    end
  end
end
