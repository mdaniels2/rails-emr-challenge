require 'rails_helper'

RSpec.describe 'Medications API', type: :request do
  let!(:medications) { create_list(:medication, 10) }

  describe 'GET /medications' do
    before { get '/medications' }

    it 'returns a list of medications' do
      expect(json).to_not be_empty
      expect(json.size).to eql(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
