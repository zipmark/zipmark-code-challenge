class Bank < ActiveRecord::Base
  validates :routing_number, uniqueness: true
  validates :routing_number, length: { is: 9 }
  validates :name, :record_type, :street, :city, :zip_code,  presence: true

  before_save :titleize_attrs


 def titleize_attrs
  self.city= city.titleize
 end

  def formatted
    response = {}
    response[:name] = name
    response[:routing_number] = routing_number
    response[:record_type] = record_type
    response[:address] = {}
    response[:address][:street] = street
    response[:address][:street_2] = street_optional unless street_optional.nil?
    response[:address][:city] = city
    response[:address][:state] = city unless state.nil?
    response[:address][:zip_code] = zip_code
    response[:updated_routing_number] = updated_routing_number unless updated_routing_number.nil?
    response
  end
end


{
  name: "First Bank of Zipmark",
  routing_number: "123456789",
  record_type: "Record Type",
  phone_number: "212-555-1212",
  address: {
    street: "56 W 22nd St",
    street_2: "9th Floor",
    city: "New York",
    state: "NY",
    zip_code: "10010"
  }
}