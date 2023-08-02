FactoryBot.define do
  factory :subscription do
    customer
    tea

    title { tea.title }
    price { 49.56 }
    status { true }
    frequency { 1 }
    customer { customer }
    tea { tea }
  end
end
