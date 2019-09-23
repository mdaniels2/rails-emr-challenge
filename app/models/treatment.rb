class Treatment < ApplicationRecord
  belongs_to :medication
  belongs_to :patient
  validates_presence_of :medication, :patient, :dosage

  after_initialize if: :new_record? do
    self.start_date ||= Time.now
  end
end
