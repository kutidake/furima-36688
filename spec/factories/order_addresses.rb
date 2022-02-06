FactoryBot.define do
  factory :order_address do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    post_code { '123-4567' }
    area_id              {2}
    municipalities { '浪速区' }
    house_number { '1-1' }
    building { '東京ハイツ' }
    telephone{ "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end