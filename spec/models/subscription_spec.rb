require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:frequency), default: 1 }
  end

  describe 'relationships' do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
  end
end
