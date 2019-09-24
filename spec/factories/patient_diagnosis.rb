FactoryBot.define do
  factory :patient_diagnosis do
    start_date { Faker::Time.between(from: DateTime.now - 5.days, to: DateTime.now, format: :default) }
    end_date { Faker::Time.between(from: DateTime.now, to: DateTime.now + 5.days, format: :default) }
    diagnosis
    patient
    provider
  end
end
