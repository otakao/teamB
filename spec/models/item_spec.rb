require 'rails_helper'

describe Item do
  describe '#create' do
    it "全ての必須項目が入力されている場合出品できる" do
      user = create(:user)
      item = build(:item)
      expect(item).to be_valid
    end

    it "nameがない場合は登録できないこと" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "discriptionがない場合は登録できないこと" do
      item = build(:item, discription: nil)
      item.valid?
      expect(item.errors[:discription]).to include("can't be blank")
    end

    it "priceがない場合は登録できないこと" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "conditionがない場合は登録できないこと" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "postageがない場合は登録できないこと" do
      item = build(:item, postage: nil)
      item.valid?
      expect(item.errors[:postage]).to include("can't be blank")
    end

    it "prefectureがない場合は登録できないこと" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture]).to include("can't be blank")
    end

    it "shipping_dateがない場合は登録できないこと" do
      item = build(:item, shipping_date: nil)
      item.valid?
      expect(item.errors[:shipping_date]).to include("can't be blank")
    end
    
    it "category_idがない場合は登録できないこと" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    
  end
end