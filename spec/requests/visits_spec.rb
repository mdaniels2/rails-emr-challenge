require 'rails_helper'

RSpec.describe 'Visits API', type: :request do
  let!(:visits) { create_list(:visit, 10) }
  let(:patient_id) { visits.first.patient_id }

  describe 'GET /patient/:id/visits' do
    before { get "/patient/#{patient_id}/visits" }

    it 'returns a list of patients' do
      expect(json).to_not be_empty
      expect(json.size).to eql(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /patient/:id/visits' do
    before do
      post "/patient/#{patient_id}/visits", params: { provider_id: visits.first.provider_id,
                                                      notes: Faker::Lorem.sentence(word_count: 10) }
      end

    it 'returns the id of the created visits' do
      expect(json).to_not be_empty
      expect(json['id']).to_not be_nil
    end

    it 'returns status code 201' do
      expect(response).to have_http_status(201)
    end
  end
end