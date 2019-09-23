class DiagnosesController < ApplicationController
  def index
    @diagnoses = Diagnosis.all
    json_response(@diagnoses)
  end
end
