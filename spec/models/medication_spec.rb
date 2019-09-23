require 'rails_helper'

RSpec.describe Medication, type: :model do
  it { should have_many(:treatments) }
  it { should validate_presence_of(:medication_name) }
  it { should validate_presence_of(:manufacturer) }
end
