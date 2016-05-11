# spec/factories/comments.rb
FactoryGirl.define do
  factory :comment do
    body "Это комментарий"
    association :answer
    association :user
    confirmed_at nil

    trait :nil_body do
      body nil
    end

    trait :comfirmed do
      confirmed_at "2016-05-11 22:34:53"
    end
  end
end
