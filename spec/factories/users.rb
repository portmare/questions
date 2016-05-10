# spec/factories/users.rb
FactoryGirl.define do
  factory :user, class: 'User' do
    name 'Иван Иванов'
    email 'i.ivanov@gmail.com'
    password 'Qwerty123'
    password_confirmation 'Qwerty123'

    trait :nil_name do
      name nil
    end
  end
end