require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_confirmation_of(:password) }
  end

  describe 'relationships' do
    it { should have_many(:subscriptions) }
    it { should have_many(:teas).through(:subscriptions) }
  end
end
