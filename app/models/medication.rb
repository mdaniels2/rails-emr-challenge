class Medication < ApplicationRecord
  has_many :treatments
  validates_presence_of :medication_name, :manufacturer
end
