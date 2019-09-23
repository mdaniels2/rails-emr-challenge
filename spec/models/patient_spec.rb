require 'rails_helper'

RSpec.describe Patient, type: :model do
  it { should have_many(:treatments).dependent(:destroy) }
  it { should have_many(:visits) }
  it { should have_many(:patient_diagnoses).dependent(:destroy) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
end
