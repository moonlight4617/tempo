FactoryBot.define do 
  factory :user do
    name { "テストユーザー" }
    email { "sample@example.com" }
    password { "12345678" }
  end
end