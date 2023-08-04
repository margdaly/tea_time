require 'rails_helper'

RSpec.describe 'Cancel Subscription', type: :request do
  let(:customer) { create(:customer) }
  let(:tea) { create(:tea) }

  describe 'PATCH /api/v0/customer/cancel' do
    it 'updates a subscription status to cancelled' do
      subscription = Subscription.create!(customer_id: customer.id, tea_id: tea.id)

      # session[:customer_id] = customer.id
      subscription_params = {
        customer_id: subscription.customer_id,
        tea_id: subscription.tea_id,
        status: 'cancelled'
      }

      headers = {
        'CONTENT_TYPE' => 'application/json',
        'HTTP_COOKIE' => "customer_id=#{customer.id}"
      }

      patch "/api/v0/customer/cancel", headers: headers, params: JSON.generate(subscription: subscription_params)

      updated_subscription = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      expect(updated_subscription[:data][:attributes][:status]).to eq('cancelled')
    end
  end
end
