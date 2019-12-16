FactoryBot.define do

  factory :product do
    name                  {"abe"}
    information           {"kkk@gmail.com"}
    condition             {"未使用に近い"}
    shipping_charge       {"着払い(購入者負担)"}
    days_before_skipment  {"2~3日で発送"}
    price                 {"3000"}
    user_id               {2}
    brand_id              {6}
    category_id           {3}
    evaluation            {"非常に良い"}
    prefecture_id         {1}
  end

end
