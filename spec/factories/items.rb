FactoryBot.define do
  factory :item do
    name             { 'hoge' }
    memo             { Faker::Lorem.sentence }
    category_id      { 2 }
    condition_id     { 2 }
    price            { 10_000 }
    days_to_ship_id  { 2 }
    shipping_fee_id  { 2 }
    prefecture_id     { 2 }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/IMG_5794.jpeg'), filename: 'IMG_5794.jpeg')
    end
  end
end
