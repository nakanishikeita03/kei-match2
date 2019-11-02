require 'rails_helper'
require 'spec_helper'

describe 'GroupFeature', type: :feature do
  let!(:user_a) { create(:user) }
  let!(:user_b) { create(:user) }

  it "お互いにフォローしたらチャットができるようになる" do
    in_browser(:user_a) do
      visit new_user_session_path
      fill_in "user[email]", with: user_a.email
      fill_in "user[password]", with: user_a.password
      click_on 'ログインする'
      visit "/users/#{user_b.id}"
      click_on("フォローする")
    end
    in_browser(:user_b) do
      visit new_user_session_path
      fill_in "user[email]", with: user_b.email
      fill_in "user[password]", with: user_b.password
      click_on 'ログインする'
      visit "/users/#{user_a.id}"
      click_on("フォローする")
      visit "/groups/new"
      expect(page).to have_content("1 人")
    end
  end
  
  it "チャット画面に移動ができるようになる" do
    in_browser(:user_a) do
      visit new_user_session_path
      fill_in "user[email]", with: user_a.email
      fill_in "user[password]", with: user_a.password
      click_on 'ログインする'
      visit "/users/#{user_b.id}"
      click_on("フォローする")
    end
    in_browser(:user_b) do
      visit new_user_session_path
      fill_in "user[email]", with: user_b.email
      fill_in "user[password]", with: user_b.password
      click_on 'ログインする'
      visit "/users/#{user_a.id}"
      click_on("フォローする")
      visit "/groups/new"
      click_on("チャットを開く")
      expect(current_path).to eq "/groups/#{Group.first.id}/messages"
    end
  end
  
end