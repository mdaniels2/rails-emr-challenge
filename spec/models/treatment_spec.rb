require 'rails_helper'

RSpec.describe Treatment, type: :model do
  it { should validate_presence_of(:medication) }
  it { should validate_presence_of(:patient) }
  it { should validate_presence_of(:dosage) }

  it 'automatically sets the start_date if one is not provided' do
    expect(described_class.new(medication: Medication.new,
                               patient: Patient.new,
                               dosage: 'test_dosage').start_date).to_not be_nil
  end

  it 'uses the given start_date if one is provided' do
    start_date = 5.days.ago
    expect(described_class.new(medication: Medication.new,
                               patient: Patient.new,
                               dosage: 'test_dosage',
                               start_date: start_date).start_date).to eql(start_date)
  end
end
