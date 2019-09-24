class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :provider
  validates_presence_of :patient, :provider

  after_initialize if: :new_record? do
    self.visit_date ||= Time.now
  end
end
