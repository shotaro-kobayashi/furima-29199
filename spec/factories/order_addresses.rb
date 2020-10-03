FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    area_id { '3' }
    city { '証市' }
    house_number { '123-4567' }
    telephone { '09088887777' }
    token { '"tok_abcdefghijk00000000000000000"' }
    house_name { '東京ハイツ' }
  end
end
