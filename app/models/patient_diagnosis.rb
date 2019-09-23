class PatientDiagnosis < ApplicationRecord
  belongs_to :diagnosis
  belongs_to :patient
  belongs_to :provider
  validates_presence_of :diagnosis, :patient, :provider

  after_initialize if: :new_record? do
    self.start_date ||= Time.now
  end
end
