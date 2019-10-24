require 'rails_helper'

describe User do
  describe '#create' do

    it "すべて満たしていれば登録可" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nameが空では登録不可" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    it "nameが16文字以上だと登録不可" do
      user = build(:user, name: "a"*16)
      user.valid?
      expect(user.errors[:name][0]).to include("is too long (maximum is 15 characters)")
    end
    it "nameが不適切ワードでは登録不可" do
      user = build(:user, name: "アホ")
      user.valid?
      expect(user.errors[:name]).to include("includes profane words.")
    end

    it "img_nameが空では登録不可" do
      user = build(:user, img_name: "")
      user.valid?
      expect(user.errors[:img_name]).to include("can't be blank")
    end

    it "self_introductionが空では登録不可" do
      user = build(:user, self_introduction: "")
      user.valid?
      expect(user.errors[:self_introduction]).to include("can't be blank")
    end
    it "self_introductionが不適切ワードでは登録不可" do
      user = build(:user, self_introduction: "アホ")
      user.valid?
      expect(user.errors[:self_introduction]).to include("includes profane words.")
    end
    it "self_introductionが201文字以上だと登録不可" do
      user = build(:user, self_introduction: "a"*201)
      user.valid?
      expect(user.errors[:self_introduction][0]).to include("is too long")
    end

    it "emailが空では登録不可" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "emailが@を含まないと登録不可 " do
      user = build(:user, email: "aaaaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailの@の前に文字がないと登録不可 " do
      user = build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end
    it "emailの@の後に文字がないと登録不可" do
      user = build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("is invalid")
    end

    it "passwordが空では登録不可" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "passwordが6文字未満だと登録不可" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short (minimum is 6 characters)")
    end

    it "password_confirmationが空では登録不可" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "passwordとpassword_confirmationが一致していないと登録不可" do
      user = build(:user, password: "00000000",password_confirmation: "11111111")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

  end
end