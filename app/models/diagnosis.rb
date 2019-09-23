class Diagnosis < ApplicationRecord
  has_many :patient_diagnoses, dependent: :destroy
  validates_presence_of :name, :diagnosis_code
end
