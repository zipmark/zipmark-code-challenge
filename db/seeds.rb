listings = BanksReader.ach_dir
bank_hashes = BanksReader.hash_banks(listings)
bank_hashes.each do |bank_hash|
  bank = BanksReader.format_bank(bank_hash)
  Bank.create(bank)
end