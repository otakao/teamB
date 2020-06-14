FactoryBot.define do
  
  factory :item_image do
    image   {File.open("#{Rails.root}/spec/fixtures/test_image.png")}    
    item_id {""}
  end
end