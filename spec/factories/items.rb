FactoryBot.define do

  factory :item do
    name                  {"hoge"}
    discription           {"aaaaa"}
    condition             {"未使用に近い"}
    postage               {"着払い（購入者負担）"}
    prefecture            {"北海道"}
    shipping_date         {"２〜３日で発送"}
    price                 {"300"}
    category_id           {"1285"}
    brand_id              {""}
    saler_id              {"1"}
    buyer_id              {""}

    after(:build) do |item|
      item.item_images << build(:item_image, item: item)
    end
  end

end