require 'rails_helper'

describe Message do
  describe '#create' do

    it "すべて満たしていれば登録可" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "contentが空では登録不可" do
      message = build(:message, content: "")
      message.valid?
      expect(message.errors[:content]).to include("can't be blank")
    end

    it "contentが141文字以上だと登録不可" do
      message = build(:message, content: "あ"*141)
      message.valid?
      expect(message.errors[:content][0]).to include("is too long")
    end

    it "contentが不適切ワードでは登録不可" do
      message = build(:message, content: "アホ")
      message.valid?
      expect(message.errors[:content]).to include("includes profane words.")
    end
  end
end