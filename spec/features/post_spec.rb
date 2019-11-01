require 'rails_helper'
require 'spec_helper'

describe 'トップページ', type: :feature do
  let!(:user_a) { create(:user) }
  let!(:user_b) { create(:user) }
  let!(:post_a) { create(:post, user_id: user_a.id )}
  let!(:task_a) { create(:task, post_id: post_a.id) }
  describe "表示部分" do
    
    before do
      visit root_path
    end

    it "表示されること" do
      expect(current_path).to eq "/"
      expect(page).to have_content("Go-En")
    end

    it "トップページから商品詳細ページに遷移できる" do
      within first('.post-contents') do
        click_on(user_a.name)
      end
      expect(current_path).to eq "/posts/#{post_a.id}"
    end

    context "ログインしていない場合" do
      it "フォローボタンを押すとログイン画面に遷移する" do
        within first('.post-contents') do
          click_on(user_a.name)
        end
        expect(current_path).to eq "/posts/#{post_a.id}"
        click_on("フォローする")
        expect(current_path).to eq new_user_session_path
      end
    end

    context "ログインしている場合" do

      context "当人の投稿の場合" do
        before do
          visit new_user_session_path
          fill_in "user[email]", with: user_a.email
          fill_in "user[password]", with: user_a.password
          click_on 'ログインする'
        end
        
        it "削除ボタンを押すと投稿が削除される" do
          within first('.post-contents') do
            click_on(user_a.name)
          end
          expect(current_path).to eq "/posts/#{post_a.id}"
          expect{
            click_on("投稿を削除")
          }.to change(Post, :count).by(-1)
          expect(current_path).to eq root_path
        end

      end

      context "当人の投稿ではない場合" do
        before do
          visit new_user_session_path
          fill_in "user[email]", with: user_b.email
          fill_in "user[password]", with: user_b.password
          click_on 'ログインする'
        end

        it "フォローボタンを押すとフォローされる" do
          within first('.post-contents') do
            click_on(user_a.name)
          end
          expect(current_path).to eq "/posts/#{post_a.id}"
          expect{
            click_on("フォローする")
          }.to change(Relationship, :count).by(1)
          expect(current_path).to eq "/users/#{user_a.id}"
        end

      end

    end

  end
end