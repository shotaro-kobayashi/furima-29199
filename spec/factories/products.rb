FactoryBot.define do
  factory :product do
    association :user
    product_name      {"abe"}
    price             {"888"}
    text              {"abe"}
    user_id           {"1"}
    category_id       {"2"}
    status_id         {"2"}
    delivery_cost_id  {"2"}
    area_id           {"2"}
    day_id            {"2"}
    after(:build) { |item| item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png') }
  end
end
