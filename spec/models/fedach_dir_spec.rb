require 'rails_helper'

RSpec.describe FedachDir, :type => :model do

  describe ".to_hash" do
    let(:row1) {"011110743B0110000151061010000000000THE CITIZENS NATIONAL BANK          182 MAIN ST, PO BOX 6002            PUTNAM              CT062600000860928792111     "}
    let(:hash)  { FedachDir.to_hash(row1) }

    it "should have all the expected keys" do
      expect(hash.keys).to include(:name, :routing_number, :record_type, :phone_number, :street, :street2, :city, :state, :zip_code)
    end

    it "should have all the expected values" do
      expect(hash[:name]).to eq "THE CITIZENS NATIONAL BANK"
      expect(hash[:routing_number]).to eq "011110743"
      expect(hash[:record_type]).to eq "1"
      expect(hash[:phone_number]).to eq "8609287921"
      expect(hash[:street]).to eq "182 MAIN ST"
      expect(hash[:street2]).to eq "PO BOX 6002"
      expect(hash[:city]).to eq "PUTNAM"
      expect(hash[:state]).to eq "CT"
      expect(hash[:zip_code]).to eq "06260-0000"
    end
  end

  describe ".import" do
    it "should save new bank records for each newline in the file" do
      VCR.use_cassette('fedach_dir') do
        expected = Faraday.get(FedachDir::BANKS_FILE).body.split("\n").length
        bank_count_before = Bank.all.count
        FedachDir.import
        expect(Bank.all.count - bank_count_before).to eq expected
      end
    end
  end

end
