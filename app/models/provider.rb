class Provider < ApplicationRecord
  has_many :visits
  has_many :patient_diagnoses
  validates_presence_of :first_name, :last_name, :office_address, :office_city, :office_state
end
