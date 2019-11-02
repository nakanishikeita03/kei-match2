require "rails_helper"

describe "UserFeature" do

  describe "facebook連携でサインアップする" do

    before do
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock
      visit root_path
      click_link "ログイン"
    end

    it "サインアップするとユーザーが増える" do
      expect{
        click_link "facebookでログイン"
        attach_file "file_photo", "spec/fixtures/user.jpg"
        fill_in "user[self_introduction]", with: 'こんにちは'
        fill_in "user[password]",with: 12345678
        fill_in "user[password_confirmation]",with: 12345678
        find('input[type="submit"]').click
      }.to change(User, :count).by(1)
    end

    it "すでに連携されたユーザーがサインアップしようとするとユーザーは増えない" do
        click_link "facebookでログイン"
        attach_file "file_photo", "spec/fixtures/user.jpg"
        fill_in "user[self_introduction]", with: 'こんにちは'
        fill_in "user[password]",with: 12345678
        fill_in "user[password_confirmation]",with: 12345678
        find('input[type="submit"]').click

      expect{
        find(".user-icon").click
        find(".signout-icon").click
        expect(current_path).to eq root_path
        click_link "ログイン"
        click_link "facebookでログイン"
      }.not_to change(User, :count)
    end

  end
end