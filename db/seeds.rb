require_relative '../lib/bank_data_parser.rb'
require_relative '../lib/bank_data_fetcher.rb'

parsed_banks = BankDataParser.new(BankDataFetcher.fetch).banks

parsed_banks.each do |bank_data|
  Bank.create(bank_data)
end
