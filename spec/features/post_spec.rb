require 'rails_helper'
require 'spec_helper'

describe 'トップページ', type: :feature do
  let!(:user_a) { create(:user) }
  let!(:user_b) { create(:user) }
  let!(:post_a) { create(:post, user_id: user_a.id )}
  let!(:task_a) { create(:task, post_id: post_a.id) }

  describe "新規投稿" do
    before do
      visit root_path
    end
    
    context "ログインしていない場合" do

      it "トップページから記事投稿ページに遷移できる" do
        find(".post-btn-link").click
        expect(current_path).to eq new_user_session_path
      end

    end

    context "ログインしていない場合" do
      before do
        visit new_user_session_path
        fill_in "user[email]", with: user_a.email
        fill_in "user[password]", with: user_a.password
        click_on 'ログインする'
      end

      it "トップページから記事投稿ページに遷移できる" do
        find(".post-btn-link").click
        expect(current_path).to eq new_post_path
      end
      
      it "記事を投稿できる" do
        expect{
          find(".post-btn-link").click
          select 'html', from: 'post_tasks_attributes_0_language'
          select '1時間', from: 'post_tasks_attributes_0_time'
          fill_in "post[text]",with: "べんきょうしました。"
          find('input[type="submit"]').click
          expect(current_path).to eq root_path
        }.to change(Post, :count).by(1)
      end

      it "記事投稿後、トップページに変遷できる" do
        find(".post-btn-link").click
        select 'html', from: 'post_tasks_attributes_0_language'
        select '1時間', from: 'post_tasks_attributes_0_time'
        fill_in "post[text]",with: "べんきょうしました。"
        find('input[type="submit"]').click
        expect(current_path).to eq root_path
      end
    end

  end


  describe "詳細/削除/フォロー" do
    
    before do
      visit root_path
    end

    it "表示されること" do
      expect(current_path).to eq "/"
      expect(page).to have_content("Go-En")
    end

    it "トップページから記事詳細ページに遷移できる" do
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