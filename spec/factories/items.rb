FactoryBot.define do
  factory :item do
    name {"7つの習慣"}
    discription {"ああああああああ"}
    price {"2700"}
    condition {"新品・未使用"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    category_id {"631"}
    prefecture {"東京都"}
    shipping_date {"２〜３日で発送"}
    saler_id {"2"}
    postage {"送料込み（出品者負担）"}

    
    after(:build) do |item|
      item.item_images << build(:item_image, item: item)
    end
  end
end