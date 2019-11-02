require 'rails_helper'
require 'spec_helper'

describe 'MessageFeature', type: :feature do
  let!(:user_a) { create(:user) }
  let!(:user_b) { create(:user) }
  let!(:group_a)  { create(:group)}
  before do
    visit new_user_session_path
    fill_in "user[email]", with: user_a.email
    fill_in "user[password]", with: user_a.password
    click_on 'ログインする'
    visit "/groups/#{Group.first.id}/messages"
  end

  it "メッセージを送信した後、現在のページから離れない" do
    fill_in "message[content]",with: "こんにちは。はじめまして。"
    click_on("Send")
    expect(current_path).to eq "/groups/#{Group.first.id}/messages"
  end

  it "メッセージを送ると表示される" do
    fill_in "message[content]",with: "こんにちは。はじめまして。"
    click_on("Send")
    visit current_path
    expect(page).to have_content("こんにちは。はじめまして。")
  end

  it "相手ユーザーにも表示される" do
    in_browser(:user_a) do
      visit new_user_session_path
      fill_in "user[email]", with: user_a.email
      fill_in "user[password]", with: user_a.password
      click_on 'ログインする'
      visit "/groups/#{Group.first.id}/messages"
      fill_in "message[content]",with: "こんにちは。はじめまして。"
      click_on("Send")
    end
    in_browser(:user_b) do
      visit new_user_session_path
      fill_in "user[email]", with: user_b.email
      fill_in "user[password]", with: user_b.password
      click_on 'ログインする'
      visit "/groups/#{Group.first.id}/messages"
      expect(page).to have_content("こんにちは。はじめまして。")
    end
  end
  
end