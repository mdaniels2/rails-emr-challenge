require 'rails_helper'

RSpec.describe Provider, type: :model do
  it { should have_many(:visits) }
  it { should have_many(:patient_diagnoses) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:office_address) }
  it { should validate_presence_of(:office_city) }
  it { should validate_presence_of(:office_state) }
end
