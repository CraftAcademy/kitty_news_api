FactoryBot.define do
  factory :user do
    email { 'user@test.com' }
    password { 'password' }
    password_confirmation { 'password' }

    factory :registered_user do
      role { :registered_user }
    end
    factory :journalist do
      role { :journalist }
      email { 'journalist@test.com' }
    end
    factory :subscriber do
      role { :subscriber }
      email { 'subscriber@test.com' }
    end
  end
end
