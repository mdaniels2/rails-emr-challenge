class PatientDiagnosesController < ApplicationController
  def show
    @diagnoses = PatientDiagnosis.where(patient_id: params[:patient_id]).includes(:diagnosis, :provider)
    format_diagnoses
    json_response(@diagnoses_hash)
  end

  def create
    set_patient
    @diagnosis = @patient.patient_diagnoses.create!(diagnosis_params)
    json_response({ id: @diagnosis.id }, :created)
  end

  private

  def format_diagnoses
    @diagnoses_hash = @diagnoses.as_json
    @diagnoses_hash.each_with_index do |diagnosis, index|
      diagnosis['diagnosing_provider'] = @diagnoses[index].provider.as_json
      diagnosis['diagnosis'] = @diagnoses[index].diagnosis.as_json
      diagnosis['diagnosis'].delete('diagnosis_code')
      diagnosis.delete('diagnosis_id')
      diagnosis.delete('provider_id')
      diagnosis.delete('patient_id')
    end
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def diagnosis_params
    params.permit(:diagnosis_id, :provider_id, :start_date, :end_date)
  end
end
