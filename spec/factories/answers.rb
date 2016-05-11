# spec/factories/answers.rb
FactoryGirl.define do
  factory :answer do
    body "MyText"
    association :user
    association :question

    trait :nil_body do
      body nil
    end
  end
end
