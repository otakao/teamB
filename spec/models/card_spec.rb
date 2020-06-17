require 'rails_helper'

describe Card do
  describe '#create' do
    it "全ての必須項目が入力されている場合カード登録できる" do
      user = build(:user)
      card = create(:card)
      expect(card).to be_valid
    end

    it "customer_idがない場合は登録できないこ" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("can't be blank")
    end

    it "card_idがない場合は登録できないこ" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card__id]).to include("can't be blank")
    end
  end
end