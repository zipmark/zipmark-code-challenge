require 'rails_helper'

RSpec.describe Bank, :type => :model do

  it "expects to have a unique routing number" do
    bank1 = create(:bank, routing_number: "123456789")
    bank2 = build(:bank, routing_number: "123456789")
    expect(bank2).to be_invalid
  end

  it "is invalid without a 9 digit routing number" do
    bank = build(:bank, routing_number: 12345678)
    expect(bank).to be_invalid
  end
end
