require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name 'test'
    nickname 'test'
    sequence :uid
    provider 'twitter'

    trait :admin do
      role 'admin'
    end

    factory :admin, traits: [:admin]
  end
end