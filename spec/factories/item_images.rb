FactoryBot.define do

  factory :item_image do
    image   {File.open("#{Rails.root}/spec/fixtures/bg-mainVisual-pict_pc.jpg")}
    item_id {""}
  end

end