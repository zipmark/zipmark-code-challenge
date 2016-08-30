require_relative '../lib/assets/bank_data_parser.rb'

parsed_banks = BankDataParser.new.banks

parsed_banks.each do |bank_data|
  Bank.create(bank_data)
end
