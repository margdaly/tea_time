require 'rails_helper'

RSpec.describe 'Cancel', type: :request do
  describe 'PATCH /api/v0/customers/{id}/cancel' do
    it 'updates a subscription status to cancelled' do
      customer = create(:customer)
      tea = create(:tea)
      subscription = Subscription.create!(customer_id: customer.id, tea_id: tea.id)

      subscription_params = ({
        customer_id: subscription.customer_id,
        tea_id: subscription.tea_id,
        status: 'cancelled'
      })

      headers = { 'CONTENT_TYPE' => 'application/json' }

      patch "/api/v0/customers/#{customer.id}/cancel", headers: headers, params: JSON.generate(subscription: subscription_params)

      updated_subscription = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(updated_subscription[:data][:attributes][:status]).to eq('cancelled')
    end
  end
end
