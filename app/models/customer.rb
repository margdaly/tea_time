class Customer < ApplicationRecord
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :password_digest, :email

  has_many :subscriptions, dependent: :destroy
  has_many :teas, through: :subscriptions
end
