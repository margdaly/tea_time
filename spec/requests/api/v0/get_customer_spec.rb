require 'rails_helper'
require 'test_helper'

RSpec.describe 'Get Customer', type: :request do
  describe 'GET /api/v0/customer' do
    before :all do
      customer_violet
    end

    it 'returns a customer and their subscriptions' do
      headers = { 'CONTENT_TYPE' => 'application/json' }

      get "/api/v0/customers/#{@violet.id}", headers: headers

      customer = JSON.parse(response.body, symbolize_names: true)
# require 'pry'; binding.pry
      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(customer[:data][:attributes][:first_name]).to eq('Violet')
      expect(customer[:data][:attributes][:last_name]).to eq('Beauregarde')
      expect(customer[:data][:attributes][:email]).to eq('v-beau@email.com')
      expect(customer[:data][:attributes][:address]).to eq('1278 Main St')
      expect(customer[:data][:attributes][:subscriptions]).to be_an(Array)

      subscription1 = customer[:data][:attributes][:subscriptions][0]
      expect(subscription1[:title]).to eq('Green Tea')
      expect(subscription1[:price]).to eq(49.56)
      expect(subscription1[:status]).to eq('cancelled')

      subscription2 = customer[:data][:attributes][:subscriptions][1]
      expect(subscription2[:title]).to eq('Sleepytime Tea')
      expect(subscription2[:price]).to eq(214.76)
      expect(subscription2[:status]).to eq('active')
    end
  end
end
