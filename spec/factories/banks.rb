FactoryGirl.define do
  factory :bank do
    name           { Faker::Company.name }
    routing_number { Faker::Number.number(9) }
    phone_number   { Faker::PhoneNumber.phone_number }
    address        { build(:address) }
  end
end
