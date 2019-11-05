require 'rails_helper'
require 'spec_helper'

describe 'GroupFeature', type: :feature do
  let!(:user_a) { create(:user) }
  let!(:user_b) { create(:user)}

  it "フォローをしたらカウントされる" do
      visit new_user_session_path
      fill_in "user[email]", with: user_b.email
      fill_in "user[password]", with: user_b.password
      click_on 'ログインする'
      expect(current_path).to eq root_path
      visit "/users/#{user_a.id}"
      expect{
        click_on("フォローする")
      }.to change(Relationship, :count).by(1)
  end
  
  it "フォローを解除したらカウントされる" do
    visit new_user_session_path
    fill_in "user[email]", with: user_b.email
    fill_in "user[password]", with: user_b.password
    click_on 'ログインする'
    expect(current_path).to eq root_path
    visit "/users/#{user_a.id}"
    click_on("フォローする")
    expect{
      click_on("フォローをはずす")
    }.to change(Relationship, :count).by(-1)
  end
end