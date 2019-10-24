require 'rails_helper'

describe Post do
  describe '#create' do

    it "すべて満たしていれば登録可" do
      post = build(:post)
      expect(post).to be_valid
    end

    it "textが空では登録不可" do
      post = build(:post, text: "")
      post.valid?
      expect(post.errors[:text]).to include("can't be blank")
    end

    it "textが141文字以上だと登録不可" do
      post = build(:post, text: "あ"*141)
      post.valid?
      expect(post.errors[:text][0]).to include("is too long")
    end

    it "textが不適切ワードでは登録不可" do
      post = build(:post, text: "アホ")
      post.valid?
      expect(post.errors[:text]).to include("includes profane words.")
    end
  end
end