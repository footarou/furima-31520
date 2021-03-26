FactoryBot.define do
  factory :shopper_info do
    zip_code {"110-1000"} 
    prefecture_id {2}
    municipality {"北区"}
    address {"青山1000"}
    building {"シェアハウス123"}
    phone_no {"12345678901"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end

