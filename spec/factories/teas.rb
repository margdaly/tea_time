FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.paragraph }
    region { Faker::Address.country }
    brew_time { Faker::Number.between(from: 3, to: 8) }
  end
end
