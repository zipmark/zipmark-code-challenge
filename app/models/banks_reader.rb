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

 def self.parse_for_updates
   banks = self.ach_dir
   banks = self.hash_banks(banks)
   banks_for_update = self.changed_banks(banks)
   banks_for_adding = self.new_banks(banks)
   self.delete_banks(banks)
   self.update_banks(banks_for_update)
   self.add_banks(banks_for_adding)
 end

 def self.changed_banks(banks_array)
  now = Time.now
  need_updating = []
  banks_array.each do |bank_hash|
    date = bank_hash[:change_date][4..5] << bank_hash[:change_date][0..1] << bank_hash[:change_date][2..3]
    next unless Time.parse(date) > Time.now - 1.month
    need_updating << self.format_bank(bank_hash)
  end
  need_updating
 end

 def self.new_banks(banks_array)
  stored_routing_numbers = Bank.pluck(:routing_number)
  need_adding = []
  banks_array.each do |bank_hash|
    next if stored_routing_numbers.include?(bank_hash[:routing_number])
    need_adding << self.format_bank(bank_hash)
  end
  need_adding
 end

 def self.delete_banks(banks_array)
  stored_routing_numbers = Bank.pluck(:routing_number)
  listed_routing_numbers = []
  banks_array.each { |bank_hash| listed_routing_numbers << bank_hash[:routing_number] }
  stored_routing_numbers.each do |routing_number|
    unless listed_routing_numbers.include?(routing_number)
      Bank.where(routing_number: routing_number).destroy_all
    end
  end
 end

 def self.update_banks(formatted_banks)
   formatted_banks.each do |bank_hash|
     bank = Bank.find_by(routing_number: bank_hash[:routing_number] )
     bank.update(bank_hash)
   end
 end

 def self.add_banks(formatted_banks)
   formatted_banks.each do |bank_hash|
     bank = Bank.create(bank_hash)
     bank.update(bank_hash)
   end
 end

end