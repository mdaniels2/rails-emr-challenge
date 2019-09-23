class MedicationsController < ApplicationController
  def index
    @medications = Medication.all
    json_response(@medications)
  end
end
