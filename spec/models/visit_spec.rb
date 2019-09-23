require 'rails_helper'

RSpec.describe Visit, type: :model do
  it { should validate_presence_of(:patient) }
  it { should validate_presence_of(:provider) }

  it 'automatically sets the date if one is not provided' do
    expect(described_class.new(patient: Patient.new,
                               provider: Provider.new).visit_date).to_not be_nil
  end

  it 'uses the given visit_date if one is provided' do
    visit_date = 5.days.ago
    expect(described_class.new(patient: Patient.new,
                               provider: Provider.new,
                               visit_date: visit_date).visit_date).to eql(visit_date)
  end
end
