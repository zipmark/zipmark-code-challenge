require 'http'
require 'rspec'

require_relative '../lib/bank_data_fetcher'

fetched = BankDataFetcher.fetch

describe BankDataFetcher do
  describe '::fetch' do

    it 'fetches bank data' do
      expect(fetched).to be_a(String)
      expect(fetched.length).to be > 155
    end

    it 'contains evenly spaced data' do
      expect((fetched+"\n").length % 156).to eq(0)
    end
  end

end
