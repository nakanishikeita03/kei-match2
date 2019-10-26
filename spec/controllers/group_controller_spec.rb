require 'rails_helper'

describe GroupsController do
  let(:user) { create(:user) }

  context "ログインしている場合" do
    before do
      login_user user
    end

    it "newページに変遷する" do
      get :new
      expect(response).to render_template :new
    end

  end

  context "ログインしていない場合" do

    it "サインインページに変遷する" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end
    
  end

end