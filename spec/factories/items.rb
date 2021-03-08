FactoryBot.define do
  factory :item do
    name             {"hoge"}
    memo             {Faker::Lorem.sentence}
    category_id      {2}
    condition_id     {2}
    price            {"10000"}
    days_to_ship_id  {2}
    shipping_fee_id  {2}
    ship_from_id     {2}
    association :user
  end
end

