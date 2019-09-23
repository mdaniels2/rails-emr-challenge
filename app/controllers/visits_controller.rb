class VisitsController < ApplicationController
  def show
    @visits = Visit.where(patient_id: params[:patient_id]).includes(:provider)
    format_visits
    json_response(@visits_hash)
  end

  def create
    set_patient
    @visit = @patient.visits.create!(visit_parameters)
    json_response({ id: @visit.id }, :created)
  end

  private

  def format_visits
    @visits_hash = @visits.as_json
    @visits_hash.each_with_index do |diagnosis, index|
      diagnosis['provider'] = @visits[index].provider.as_json
      diagnosis.delete('provider_id')
      diagnosis.delete('patient_id')
    end
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def visit_parameters
    params.permit(:provider_id, :visit_date, :notes)
  end
end
