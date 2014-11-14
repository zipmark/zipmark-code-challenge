require 'open-uri'
class BanksReader

  @@default_specs = {
    routing_number: 0..8,
    record_type: 19,
    change_date: 20..25,
    updated_routing_number: 26..34,
    name: 35..70,
    address: 71..106,
    city: 107..126,
    state: 127..128,
    zip_code: 129..133
  }

  @@record_values = {
      0 => "Institution is a Federal Reserve Bank",
      1 => "Send items to customer routing number",
      2 => "Send items to customer using new routing number field"
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
    bank_hash.delete(:change_date)
    bank_hash = self.establish_streets(bank_hash)
    bank_hash = self.establish_record_type(bank_hash)
    bank_hash = self.set_updated_routing(bank_hash)
  end

  def self.establish_streets(bank_hash)
    if bank_hash[:address]
      street_array = bank_hash[:address].split(",")
      bank_hash[:street] = street_array[0]
      if street_array[1]
        bank_hash[:street_optional] = street_array[1]
      else
        bank_hash[:street_optional] = nil
      end
      bank_hash.delete(:address)
      bank_hash
    end
  end

  def self.establish_record_type(bank_hash, record_values= @@record_values)
    bank_hash[:record_type] = record_values[bank_hash[:record_type].to_i]
    bank_hash
  end

  def self.set_updated_routing(bank_hash)
    bank_hash[:updated_routing_number] = nil if bank_hash[:updated_routing_number] == "000000000"
    bank_hash
  end

end