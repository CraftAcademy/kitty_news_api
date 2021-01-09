FactoryBot.define do
  factory :user do
    email { "user@test.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
