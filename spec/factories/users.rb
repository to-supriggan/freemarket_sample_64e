FactoryBot.define do

  factory :user do
    nick_name             {"abe"}
    email                 {"kkk@gmail.com"}
    encrypted_password    {"00000000"}
    kana_name             {"カナ"}
    name                  {"加奈"}
    birthday              {"1982/2/4"}
    payment_method        {"000"}
  end

end