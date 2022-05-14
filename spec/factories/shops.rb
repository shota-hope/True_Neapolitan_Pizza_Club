FactoryBot.define do
  factory :shop do
    name { "MyString" }
    tel_number { "MyString" }
    address { "MyString" }
    access { "MyString" }
    open { "MyString" }
    close { "MyString" }
    member_number { 1 }
    member_since { "MyString" }
    pizza_maker { "MyString" }
    oven_used { "MyString" }
    url { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
    association :prefecture
  end
end
