require 'rails_helper'

RSpec.describe Bank, type: :model do
  let(:bank) { build(:bank) }

  describe "routing number validation" do 
    it "makes sure the routing number is 9 characters long" do 
      bank.routing_number = '88888888'
      bank.save
      expect(
        bank.errors[:routing_number].any? { |e| e =~ /should be 9 characters/ }
      ).to be(true)
    end

    it "makes sure the routing number consists of numeric characters" do 
      bank.routing_number = 'alpha'
      bank.save
      expect(
        bank.errors[:routing_number].any? { |e| e =~ /is not a number/ }
      ).to be(true)
    end
  end

  describe "address validation" do 
    it "makes sure the address is present" do 
      bank.address = nil
      bank.save
      expect(
        bank.errors[:address].any? { |e| e =~ /can't be blank/ }
      ).to be(true)
    end
  end

  describe "#save" do 
    it "automatically saves it's associated address" do 

    end
  end

  describe "#destroy" do 
    it "destroys itself and it's associated address" do 
      Bank.delete_all
      Address.delete_all
      bank.save
      address = bank.address
      expect(Bank.count).to eq(Address.count)
      bank.destroy
      expect(Bank.count).to eq(Address.count)
      expect(Address.exists?(address)).to be(false)
      expect(Bank.exists?(bank)).to be(false)
    end
  end
end
