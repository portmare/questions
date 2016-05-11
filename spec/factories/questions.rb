# spec/factories/questions.rb
FactoryGirl.define do
  factory :question do
    title "MyString"
    body "MyText"
    association :user

    trait :nil_title do
      title nil
    end

    trait :nil_body do
      body nil
    end
  end
end
