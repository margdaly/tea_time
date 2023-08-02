FactoryBot.define do
  factory :subscription do
    title { "MyString" }
    price { 1.5 }
    status { false }
    frequency { 1 }
    customer { nil }
    tea { nil }
  end
end
