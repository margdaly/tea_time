FactoryBot.define do
  factory :subscription do
    transient do
      customer { create(:customer) }
      tea { create(:tea) }
    end
    title { tea.title }
    price { 3.5 }
    status { true }
    frequency { 1 }
    customer { customer }
    tea { tea }
  end
end
