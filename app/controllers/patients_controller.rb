class PatientsController < ApplicationController
  def index
    @patients = Patient.all
    json_response(@patients)
  end

  def create
    @patient = Patient.create!(patient_params)
    json_response({ id: @patient.id }, :created)
  end

  def show
    set_patient
    json_response(@patient)
  end

  private

  def patient_params
    params.permit(:first_name, :last_name, :email)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end
end
