# require "rails_helper"

# describe "UserFeature" do

#   describe "facebook連携でサインアップする" do

#     before do
#       OmniAuth.config.mock_auth[:facebook] = nil
#       Rails.application.env_config['omniauth.auth'] = facebook_mock
#       visit root_path
#       click_link "ログイン"
#     end

#     it "サインアップするとユーザーが増える" do
#       expect{
#         click_link "facebookでログイン"
#         fill_in "self_introduction", with: 'こんにちは'
#         fill_in "password",with: 12345678
#         fill_in "password_confirmation",with: 12345678
#         fill_in "fname", with: 'user.jpeg'
#         find('input[type="submit"]').click
#       }.to change(User, :count).by(1)
#     end

#     it "すでに連携されたユーザーがサインアップしようとするとユーザーは増えない" do
#       click_link "facebookでログイン"
#       click_link "ログアウト"
#       click_link "ログイン"
#       expect{
#         click_link "facebookでログイン"
#       }.not_to change(User, :count)
#     end

#   end
# end