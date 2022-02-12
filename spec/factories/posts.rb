FactoryBot.define do
  factory :post do
    title { "MyString" }
    body { "MyText" }
    image { "MyString" }
    user { nil }
  end
end
