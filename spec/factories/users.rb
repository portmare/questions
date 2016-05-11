# spec/factories/users.rb
FactoryGirl.define do
  factory :user, class: 'User' do
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password 'Qwerty123'
    password_confirmation 'Qwerty123'

    trait :nil_name do
      name nil
    end

    trait :diff_password do
      password_confirmation '123Qwerty'
    end

    trait :short_password do
      password '1234'
      password_confirmation '1234'
    end
  end
end