require 'rails_helper'

describe User do
  describe '#create' do

    it "nicknameとemail、passwordとpassword_confirmationとfirst_name、last_name、first_name_furigana、last_name_furigana、birthdayが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "first_name_furiganaがカタカナの場合に登録できないこと" do
      user = build(:user,first_name_furigana: "ヤマダ")
      user.valid?
      expect(user.errors[:first_name_furigana]).to include("is invalid")
    end

    it "emailに@が抜けてたら登録できないこと" do
      user = build(:user,email: "kkkkk.com")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end


    # it "nicknameがない場合は登録できないこと" do
    #   user = build(:user, nickname: "")
    #   user.valid?
    #   expect(user.errors[:nickname]).to include("can't be blank")
    # end
  
    # it "emailがない場合は登録できないこと" do
    #   user = build(:user, email: "")
    #   user.valid?
    #   expect(user.errors[:email]).to include("can't be blank")
    # end

    # it "passwordがない場合は登録できないこと" do
    #   user = build(:user, password: "")
    #   user.valid?
    #   expect(user.errors[:password]).to include("can't be blank")
    # end

    # it "password_confirmationがない場合は登録できないこと" do
    #   user = build(:user, password_confirmation: "")
    #   user.valid?
    #   expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    # end

    # it "first_nameがない場合は登録できないこと" do
    #   user = build(:user, first_name: "")
    #   user.valid?
    #   expect(user.errors[:first_name]).to include("can't be blank")
    # end

    # it "last_nameがない場合は登録できないこと" do
    #   user = build(:user, last_name: "")
    #   user.valid?
    #   expect(user.errors[:last_name]).to include("can't be blank")
    # end
  end
end

      