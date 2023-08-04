require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
  end

  describe 'attributes' do
    before :all do
      @tea = Tea.create!(title: 'Green Tea', description: '18 count', region: 'China', brew_time: 7)
      @customer = create(:customer)
      @subscription = Subscription.create!(customer_id: @customer.id, tea_id: @tea.id)
    end

    it 'returns the title of the tea' do
      expect(@subscription.title).to eq(@tea.title)
    end

    it 'defaults status to active' do
      expect(@subscription.status).to eq('active')
    end

    it 'defaults frequency to monthly enum 1' do
      expect(@subscription.frequency).to eq('monthly')
    end

    it 'returns the price based on frequency' do
      expect(@subscription.price).to eq(49.56)

      @subscription.update(frequency: 0)
      expect(@subscription.price).to eq(214.76)

      @subscription.update(frequency: 2)
      expect(@subscription.price).to eq(16.52)
    end
  end
end
