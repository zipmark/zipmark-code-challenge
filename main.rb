require 'sinatra'
require 'sinatra/reloader'


get "/banks" do
  erb :"banks/index"
end

post "/banks" do
  erb :show
end