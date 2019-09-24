FactoryBot.define do
  factory :treatment do
    dosage { "#{Faker::Measurement.metric_weight}/day" }
    start_date { Faker::Time.between(from: DateTime.now - 5.days, to: DateTime.now, format: :default) }
    end_date { Faker::Time.between(from: DateTime.now, to: DateTime.now + 5.days, format: :default) }
    medication
    patient
  end
end
