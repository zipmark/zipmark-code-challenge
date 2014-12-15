FactoryGirl.define do
  factory :address do
    line_1   { Faker::Address.street_address }
    line_2   { Faker::Address.secondary_address }
    city     { Faker::Address.city }
    state    { Faker::Address.state_abbr }
    zip_code { Faker::Number.number(5) }
  end
end
