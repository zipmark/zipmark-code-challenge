require 'open-uri'
class BanksReader

  @@default_specs = {
    routing_number: 0..8,
    record_type: 19,
    change_date: 20..25,
    updated_routing: 26..34,
    name: 35..70,
    address: 71..106,
    city: 107..126,
    state: 127..128,
    zip_code: 129..133
  }

  def self.ach_dir(url= "http://www.fededirectory.frb.org/FedACHdir.txt")
    text = URI.parse(url).read.split("\n")
  end

  def self.hash_banks(banks_array, options= @@default_specs)
    output = banks_array.map do |listing|
      bank_options = options.dup
      bank_options.each  do |key, value|
        bank_options[key] = listing[value].strip
      end
      bank_options
    end
  end

  def self.format_bank(bank_hash)
    bank_hash = self.establish_streets(bank_hash)
    bank_hash = self.establish_record_type(bank_hash)
  end

  def self.establish_streets(bank_hash)
  end

  def self.establish_record_type(bank_hash)
  end


end