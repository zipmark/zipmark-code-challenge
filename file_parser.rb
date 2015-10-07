require "sinatra/base"
require "sinatra/reloader"
require 'json'

class BankParser
	
	attr_reader :id

	BANK_DATA = File.readlines("truncated_list.txt")
	
	def initialize(id)
		@id = id
	end

	def find_bank_by_id
		BANK_DATA.detect { |bank| bank[0, 9] == id }
	end
end

class BankFromString 

	attr_reader :name, :routing_number, :phone_number

	def initialize(bank_string)
		@name = bank_string[35, 36].strip
		@routing_number = bank_string[0, 9]
		# @record_type = bank_string[x,y]
		# @phone_number = bank_string[x,y]
		# @street: "56 W 22nd St",
		# @street_2: "9th Floor",
		# @city: "New York",
		# @state: "NY",
		# @zip_code: "10010"
	end

	def formated_data
		bank_item = {:name => @name, :routing_number => routing_number, :address => {:street => "56 W 22nd Floor"} }
		JSON.pretty_generate(bank_item)
	end
end

class Banks < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
	
	get '/banks/:id' do
		parser = BankParser.new(params[:id])
		bank_string = parser.find_bank_by_id
		bank_object = BankFromString.new(bank_string)
		bank_object.formated_data
	end
	run! if app_file == $0	
end