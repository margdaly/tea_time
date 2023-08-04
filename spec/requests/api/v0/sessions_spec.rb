require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  # describe 'POST /create' do
  #   it 'returns http success' do
  #     create(:customer)

  #     post '/api/v0/sessions/create'

  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      delete '/api/v0/sessions/destroy'
      expect(response).to have_http_status(:success)
    end
  end

end
