require 'rails_helper'

RSpec.describe 'Diagnoses API', type: :request do
  let!(:diagnoses) { create_list(:diagnosis, 10) }

  describe 'GET /diagnoses' do
    before { get '/diagnoses' }

    it 'returns a list of diagnoses' do
      expect(json).to_not be_empty
      expect(json.size).to eql(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end