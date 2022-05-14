FactoryBot.define do
  factory :post do
    title { "ピザ食べました" }
    body { "おいしかったです。" }
    image { nil }
    association :user
    association :shop
  end
end
