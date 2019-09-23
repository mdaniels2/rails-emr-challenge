require 'rails_helper'

RSpec.describe PatientDiagnosis, type: :model do
  it { should validate_presence_of(:diagnosis) }
  it { should validate_presence_of(:patient) }
  it { should validate_presence_of(:provider) }
end
