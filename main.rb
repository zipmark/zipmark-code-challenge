require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

URL = "https://gist.githubusercontent.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list"

get "/banks" do
  @banks = HTTParty.get(URL)

  erb :"banks/index"
end

get "/banks/:id" do
  id = params[:id]
  binding.pry
  erb :"banks/show"
end