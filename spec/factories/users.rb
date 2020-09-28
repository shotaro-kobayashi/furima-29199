FactoryBot.define do
  factory :user do
    id                    {"2"}
    nickname              {"abe"}
    email                 {"test@com"}
    password              {"koba5884"}
    password_confirmation {password}
    first_name            {"小林"}
    last_name             {"将"}
    first_furi            {"コバヤシ"}
    last_furi             {"ショウ"}
    date                  {"1988-11-11"}
  end
end