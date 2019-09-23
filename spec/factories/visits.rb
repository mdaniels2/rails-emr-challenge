FactoryBot.define do
  factory :visit do
    visit_date { Faker::Time.between(from: DateTime.now - 5.days, to: DateTime.now, format: :default) }
    patient
    provider
  end
end