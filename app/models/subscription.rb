class Subscription < ApplicationRecord
  validates_presence_of :status, :frequency
  belongs_to :customer
  belongs_to :tea

  enum :status, { active: true, cancelled: false }
  enum :frequency, { weekly: 0, monthly: 1, seasonal: 2 }

  def title
    tea.title
  end
end
