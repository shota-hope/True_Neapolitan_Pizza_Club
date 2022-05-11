FactoryBot.define do
  factory :user do
    name { "ohno" }
    sequence(:email)  { |n| "tester#{n}@example.com" }
    password { "ohnoohno" }
    password_confirmation { "ohnoohno" }
  end
end
