class TreatmentsController < ApplicationController
  def show
    @treatments = Treatment.where(patient_id: params[:patient_id]).includes(:medication)
    format_treatments
    json_response(@treatments_hash)
  end

  def create
    set_patient
    @treatment = @patient.treatments.create!(treatment_params)
    json_response({ id: @treatment.id }, :created)
  end

  private

  def format_treatments
    @treatments_hash = @treatments.as_json
    @treatments_hash.each_with_index do |treatment, index|
      treatment['medication'] = @treatments[index].medication.as_json
      treatment['medication'].delete('manufacturer')
      treatment.delete('medication_id')
      treatment.delete('patient_id')
    end
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def treatment_params
    params.permit(:medication_id, :dosage, :start_date, :end_date)
  end
end
