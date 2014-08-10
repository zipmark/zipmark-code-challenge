require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'


get "/banks" do
  erb :"banks/index"
end

get "/banks/:id" do
  id = params[:id]
  binding.pry
  erb :"banks/show"
end