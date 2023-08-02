class Customer < ApplicationRecord
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :address, :password_digest, :email
  
  has_many :subscriptions, dependent: :destroy
  has_many :teas, through: :subscriptions

  has_secure_password
end
