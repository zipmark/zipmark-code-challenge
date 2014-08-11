require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

require_relative 'main_helper'

URL = "https://gist.githubusercontent.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list"

include ProcessMethods

get "/banks" do
  info = HTTParty.get(URL)
  banks_string = array_splitter(info.split(""), 156)
  # banks_stripped = stripper(banks_string)
  bankers = []
  banks_string.each do |bank|
    chars = bank.split("")
    bankers << [chars[0..70].join, chars[71..106].join, chars[107..126].join, chars[127..156].join]
  end
  binding.pry

  # {
  # name: "First Bank of Zipmark",
  # routing_number: "123456789",
  # record_type: "Record Type",
  # phone_number: "212-555-1212",
  # address: {
  #   street: "56 W 22nd St",
  #   street_2: "9th Floor",
  #   city: "New York",
  #   state: "NY",
  #   zip_code: "10010"
  # }
# }
  banks = []
  bankers.each do |bank|
    banks << {name: bank[0].split("")[35..70].join.strip, 
      routing_number: bank[0].split("")[0..8].join,
      record_type: "string",
      address: {
        street: before_comma(bank[1]), 
        street_2: after_comma(bank[1]),
        city: bank[2].strip,
        state: bank[3].split("")[0..1].join,
        zip_code: bank[3].split("")[2..6].join
      }
    }
  end
  binding.pry
  
  # take 71 characts to be converted into values of data hash keys
  # take 85 characts to be converted into values of data hash keys


  # bank_info_with_leading_spaces = HTTParty.get(URL).split("  ").delete_if { |x| x == "" }
  # bank_info_without_leading_spaces = bank_info_with_leading_spaces.map { |x| x.strip }
  # bank_info_without_leading_spaces.insert(bank_info_without_leading_spaces.index("011000028O0110000151072811000000000STATE STREET BANK AND TRUST COMPANY JAB2NW") + 1, "JAB2NW")  
  # bank_info_without_leading_spaces[bank_info_without_leading_spaces.index("011000028O0110000151072811000000000STATE STREET BANK AND TRUST COMPANY JAB2NW")] = "011000028O0110000151072811000000000STATE STREET BANK AND TRUST COMPANY"

  # deletable_values = []
  # clean_bank_info = bank_info_without_leading_spaces.each_with_index.map do |x, i|
  #   if /\b,/.match(x)
  #     x = x + " " + bank_info_without_leading_spaces[i + 1] 
  #     deletable_values << bank_info_without_leading_spaces[i + 1] 
  #   end
  # end  

  # binding.pry

  # deletable_values.each { |value| clean_bank_info.delete(value) }

  # binding.pry

  # @banks = []

  # num_of_banks = bank_info_without_leading_spaces.length / 4
  # i = 0
  # num_of_banks.times do 
  #  @banks << four_indexes(bank_info_without_leading_spaces, i)
  #   i += 4
  # end
  # @banks.uniq
  # binding.pry
  erb :"banks/index"
end

get "/banks/:id" do
  id = params[:id]
  binding.pry
  erb :"banks/show"
end