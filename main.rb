require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

require_relative 'data_processor'

URL = "https://gist.githubusercontent.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list"

get "/banks" do
  
  content_type :json

  processed_data = DataProcessor.new(URL)
  @banks = processed_data.banks

  @banks.to_json
 
end

get "/banks/:id" do
  
  content_type :json

  routing_number = params[:id]
  processed_data = DataProcessor.new(URL)
  @bank = processed_data.search(routing_number)

  @bank.to_json

end