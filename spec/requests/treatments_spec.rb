require 'rails_helper'

RSpec.describe 'Treatments API', type: :request do
  let!(:treatments) { create_list(:treatment, 10) }
  let(:patient_id) { treatments.first.patient_id }

  describe 'GET /patient/:id/treatments' do
    before { get "/patient/#{patient_id}/treatments" }

    it 'returns a list of patients' do
      expect(json).to_not be_empty
      expect(json.size).to eql(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /patient/:id/treatments' do
    context 'when all required parameters are provided' do
      before do
        post "/patient/#{patient_id}/treatments", params: { medication_id: treatments.first.medication_id,
                                                            dosage: "#{Faker::Measurement.metric_weight}/day",
                                                            start_date: 2.weeks.ago }
      end

      it 'returns the id of the created treatment' do
        expect(json).to_not be_empty
        expect(json['id']).to_not be_nil
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when medication_id is not provided' do
      before do
        post "/patient/#{patient_id}/treatments", params: { dosage: "#{Faker::Measurement.metric_weight}/day",
                                                            start_date: 2.weeks.ago,
                                                            foo: 'bar'}
      end

      it 'returns a validation error' do
        expect(response.body).to match(/Validation failed: Medication must exist/)
      end

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end
end