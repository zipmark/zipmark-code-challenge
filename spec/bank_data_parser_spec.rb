require 'http'
require 'rspec'

require_relative '../lib/bank_data_parser'

test_data = "011104173O0110000151042811000000000FIRST NIAGARA BANK, NA              P.O. BOX 886                        LOCKPORT            NY140950886800421000411     \n011104199O0110000151062609000000000PEOPLES BANK                        850 MAIN STREET                     BRIDGEPORT          CT066010000203338717111     \n"
bank_data = BankDataParser.new(test_data)
bank = bank_data.parse_bank_data(test_data[0...156])

describe BankDataParser do
  describe '#raw_bank_data' do
    it 'splits data at fixed width' do
      expect(bank_data.raw_bank_data.count).to eq(2)
      expect(bank_data.raw_bank_data[0].length).to eq(156)
      expect(bank_data.raw_bank_data[1].length).to eq(156)
    end

  end
  describe '#parse_bank_data' do

    it 'parses routing number' do
      expect(bank[:routing_num]).to eq("011104173")
    end

    it 'trims parsed fields' do
      expect(bank[:cust_name]).to eq("FIRST NIAGARA BANK, NA")
    end

    it 'parses all fields' do
      expect(bank.keys.length).to eq(15)
    end

  end
end
