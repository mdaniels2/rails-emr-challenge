FactoryBot.define do
  factory :provider do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    office_address { Faker::Address.street_address }
    office_city { Faker::Address.city }
    office_state { Faker::Address.state }
  end
end
