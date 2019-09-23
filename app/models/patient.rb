class Patient < ApplicationRecord
  has_many :treatments, dependent: :destroy
  has_many :visits
  has_many :patient_diagnoses, dependent: :destroy
  validates_presence_of :first_name, :last_name, :email
end
