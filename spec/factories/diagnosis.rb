FactoryBot.define do
  factory :diagnosis do
    name { Faker::Lorem.sentence(word_count: 3) }
    diagnosis_code { Faker::Lorem.word }
  end
end