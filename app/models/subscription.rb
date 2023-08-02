class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  enum :status, { active: true, cancelled: false }
  enum :frequency, { weekly: 0, monthly: 1, seasonal: 2 }

  def title
    tea.title
  end

  # price is based off of 'celestial seasonings tea'
  # box at Safeway costs ~$4.13 
  # price is cost per year
  def price
    case frequency
    when 'weekly' then 214.76
    when 'monthly' then 49.56
    when 'seasonal' then 16.52
    end
  end

end
