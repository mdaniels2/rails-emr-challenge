FactoryBot.define do
  factory :medication do
    medication_name { Faker::Lorem.word }
    manufacturer { Faker::Lorem.word }
  end
end