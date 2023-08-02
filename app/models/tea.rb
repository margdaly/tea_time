class Tea < ApplicationRecord
  validates_presence_of :title

  has_many :subscriptions
  has_many :customers, through: :subscriptions
end
