class Customer < ApplicationRecord
  validates_with EmailAddress::ActiveRecordValidator, field: :email
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :address, :password_digest, :email
  
  has_many :subscriptions
  has_many :teas, through: :subscriptions

  has_secure_password
end
