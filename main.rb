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

  # break info string into elements in an array by bank
  bankers = []
  banks_string.each do |bank|
    chars = bank.split("")
    bankers << [chars[0..70].join, chars[71..106].join, chars[107..126].join, chars[127..156].join]
  end

  # parse data, using string length as the limiting pattern
  # this method could be folded into the above so that you only iterate through the data once
  # which would become especially important the larger the data set
  @banks = {}
  bankers.each do |bank|
    @banks[bank[0].split("")[0..8].join] = {
      name: bank[0].split("")[35..70].join.strip, 
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
 
  erb :"banks/index"

end

get "/banks/:id" do
  
  id = params[:id]

  info = HTTParty.get(URL)
  banks_string = array_splitter(info.split(""), 156)
  
  # break info string into elements in an array by bank
  bankers = []
  banks_string.each do |bank|
    chars = bank.split("")
    bankers << [chars[0..70].join, chars[71..106].join, chars[107..126].join, chars[127..156].join]
  end


  # parse data, using string length as the limiting pattern
  # this method could be folded into the above so that you only iterate through the data once
  # which would become especially important the larger the data set
  @banks = {}
  bankers.each do |bank|
    @banks[bank[0].split("")[0..8].join] = {
      name: bank[0].split("")[35..70].join.strip, 
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

  @bank = @banks[id.to_s].to_json

  erb :"banks/show"

end