require_relative 'data_processor_helper'

class DataProcessor

  include ProcessMethods

  attr_reader :banks

  def initialize(url)
    info = HTTParty.get(url)
    @banks = banks_hash(banks_array(info))
  end

  def banks_array(info)
    banks_array = []
    
    # converts one large string into 100 different strings by bank of certain length
    # 156 provides the length, which is the number of characters 
    # associated with a bank string in the raw data
    banks_as_strings = array_of_strings(info.split(""), 156)

    # break info string into elements in an array by bank
    banks_as_strings.each do |bank_as_string|
      chars = bank_as_string.split("")
      banks_array << [chars[0..70].join, chars[71..106].join, chars[107..126].join, chars[127..156].join]
    end

    return banks_array
  end

  def banks_hash(banks_array)
    # parse data, using string length as the limiting pattern
    # this method could be folded into the above so that you only iterate through the data once
    # which would become especially important the larger the data set
    banks = {}
    banks_array.each do |bank|
      banks[bank[0].split("")[0..8].join] = {
        name: bank[0].split("")[35..70].join.strip, 
        routing_number: bank[0].split("")[0..8].join,
        record_type: "string",
        telephone_number: telephone_number(bank[3]),
        address: {
          street: before_comma(bank[1]), 
          street_2: after_comma(bank[1]),
          city: bank[2].strip,
          state: bank[3].split("")[0..1].join,
          zip_code: bank[3].split("")[2..6].join
        }
      }
    end

    return banks
  end

  def search(routing_number)
    @banks[routing_number.to_s]
  end 

end