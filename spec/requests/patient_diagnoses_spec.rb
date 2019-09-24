require 'rails_helper'

RSpec.describe 'Patient Diagnoses API', type: :request do
  let!(:diagnoses) { create_list(:patient_diagnosis, 10) }
  let(:patient_id) { diagnoses.first.patient_id }

  describe 'GET /patient/:id/diagnoses' do
    before { get "/patient/#{patient_id}/diagnoses" }

    it 'returns a list of patients' do
      expect(json).to_not be_empty
      expect(json.size).to eql(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /patient/:id/diagnoses' do
    context 'when all required parameters are provided' do
      before do
        post "/patient/#{patient_id}/diagnoses", params: { diagnosis_id: diagnoses.first.diagnosis_id,
                                                           provider_id: diagnoses.first.provider_id,
                                                           start_date: 2.weeks.ago }
      end

      it 'returns the id of the created diagnosis' do
        expect(json).to_not be_empty
        expect(json['id']).to_not be_nil
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when diagnosis_id is not provided' do
      before do
        post "/patient/#{patient_id}/diagnoses", params: { provider_id: diagnoses.first.provider_id,
                                                           start_date: 2.weeks.ago }
      end

      it 'returns a validation error' do
        expect(response.body).to match(/Validation failed: Diagnosis must exist/)
      end

      it 'returns a status code 422' do
        expect(response).to have_http_status(422)
      end
    end

    context 'when provider_id is not provided' do
      before do
        post "/patient/#{patient_id}/diagnoses", params: { diagnosis_id: diagnoses.first.diagnosis_id,
                                                           start_date: 2.weeks.ago }
      end

      it 'returns a validation error' do
        expect(response.body).to match(/Validation failed: Provider must exist/)
      end

      it 'returns a status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end