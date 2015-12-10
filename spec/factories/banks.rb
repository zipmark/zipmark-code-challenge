FactoryGirl.define do
  factory :bank do
    name "Bank of #{Faker::Address.state}"
    routing_number { Faker::Number.number(9).to_s }
    record_type "1"
    phone_number "4155958285"
    street { Faker::Address.street_address }
    street2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zip_code { Faker::Address.zip }
  end

end
