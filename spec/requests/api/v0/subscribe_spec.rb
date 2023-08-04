require 'rails_helper'

RSpec.describe 'Subscribe', type: :request do
  describe 'POST /api/v0/customer/subscribe' do
    it 'creates a subscription for a customer' do
      customer = create(:customer)
      tea = create(:tea)

      subscription_params = {
        customer_id: customer.id,
        tea_id: tea.id,
        frequency: 'weekly'
      }

      headers = { 'CONTENT_TYPE' => 'application/json' }

      post '/api/v0/customer/subscribe', headers: headers, params: JSON.generate(subscription_params)

      new_subscription = Subscription.last

      expect(response).to be_successful
      expect(response.status).to eq(201)
      
      expect(new_subscription.customer_id).to eq(customer.id)
      expect(new_subscription.tea_id).to eq(tea.id)
      expect(new_subscription.title).to eq(tea.title)
      expect(new_subscription.status).to eq('active')
      expect(new_subscription.frequency).to eq('weekly')
      expect(new_subscription.price).to eq(214.76)
    end
  end
end
