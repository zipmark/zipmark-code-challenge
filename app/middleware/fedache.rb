require 'fixed_length/parser'
require 'fixed_length/column'
require 'faraday_middleware/response_middleware'

class Fedache < FaradayMiddleware::ResponseMiddleware
  extend FixedLength::Column

  column :routing_number, length: 9
  column :office_code, length: 1
  column :servicing_frb_number, length: 9
  column :record_type_code, length: 1
  column :change_date, length: 6
  column :new_routing_number, length: 9
  column :customer_name, length: 36
  column :address, length: 36
  column :city, length: 20
  column :state, length: 2
  column :zip_code, length: 5
  column :zip_code_extension, length: 4
  column :telephone_area_code, length: 3
  column :telephone_prefix_number, length: 3
  column :telephone_suffix_number, length: 4
  column :institution_status_code, length: 1
  column :data_view_code, length: 1

  define_parser do |body|
    FixedLength::Parser.new(columns, body).parse
  end
end

if Faraday::Middleware.respond_to? :register_middleware
  # faraday >= 0.9
  Faraday::Response.register_middleware :fedache => Fedache
else
  # faraday < 0.9
  Faraday.register_middleware :response, :fedache => Fedache
end
