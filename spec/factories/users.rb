FactoryBot.define do
  factory :user do
    name { "ohno" }
    sequence(:email)  { |n| "hogehoge#{n}@example.com" }
    password { "ohnoohno" }
    password_confirmation { "ohnoohno" }
  end
end
