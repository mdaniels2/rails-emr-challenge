require 'rails_helper'

RSpec.describe 'Patients API', type: :request do
  let!(:patients) { create_list(:patient, 10) }
  let(:patient_id) { patients.first.id }

  describe 'GET /patients' do
    before { get '/patients' }

    it 'returns a list of patients' do
      expect(json).to_not be_empty
      expect(json.size).to eql(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /patient/:id' do
    before { get "/patient/#{patient_id}" }

    context 'when patient exists' do
      it 'returns the patient information' do
        expect(json).to_not be_empty
        expect(json['id']).to eql(patient_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the patient does not exist' do
      let(:patient_id) { -1 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Patient/)
      end
    end
  end

  describe 'POST /patient' do
    context 'when endpoint receives valid parameters' do
      before do
        post '/patient', params: { first_name: Faker::Name.first_name,
                                   last_name: Faker::Name.last_name,
                                   email: Faker::Internet.email }
      end

      it 'returns the patient id' do
        expect(json).to_not be_empty
        expect(json['id']).to_not be_nil
      end

      it 'returns a status code 200' do
        expect(response).to have_http_status(201)
      end
    end
  end

  context 'when endpoint receives invalid parameters' do
    before do
      post '/patient', params: { first_name: Faker::Name.first_name,
                                 last_name: Faker::Name.last_name }
    end

    it 'returns an appropriate error code' do
      expect(response.body).to match(/Validation failed: Email can't be blank/)

    end

    it 'returns a status code 422' do
      expect(response).to have_http_status(422)
    end
  end
end