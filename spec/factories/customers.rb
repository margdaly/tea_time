FactoryBot.define do
  factory :customer do
    first_name { "MyString" }
    last_name { "MyString" }
    address { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
  end
end
