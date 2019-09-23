require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
  it { should have_many(:patient_diagnoses).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:diagnosis_code) }
end
