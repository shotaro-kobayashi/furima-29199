FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"小林"}
    last_name             {"将"}
    first_furi            {"コバヤシ"}
    last_furi             {"ショウ"}
    date                  {"1988-11-11"}
  end
end