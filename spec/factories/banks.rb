FactoryGirl.define do
  factory :bank do
    name Faker::Company.name
    routing_number Faker::Number.number(9)
    record_type ["Institution is a Federal Reserve Bank",
                 "Send items to customer routing number",
                 "Send items to customer using new routing number field"].sample
    street Faker::Address.street_address
    street_optional Faker::Address.secondary_address
    city Faker::Address.city
    state Faker::Address.state
    zip_code Faker::Address.zip_code
    updated_routing_number [Faker::Number.number(9), nil].sample
  end

end