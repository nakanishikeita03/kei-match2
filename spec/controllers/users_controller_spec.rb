require 'rails_helper'


describe UsersController do
  let(:user) { create(:user) }

  describe 'GET #show' do

    it "@userの値が適切" do
    user = create(:user)
    get :show, params: { id: user }
    expect(assigns(:user)).to eq user
    end

    it "showに変遷する" do
      get :show, params: { id: user }
      expect(response).to render_template :show
    end
  end

  describe 'GET #recommend' do

  context "ログインしている場合" do
    before do
      login_user user
    end
      it "@recommendusersの値が適切" do
        recommendusers = create_list(:user, 3) 
        get :recommend
        expect(assigns(:recommendusers)).to match(recommendusers.sort{ |a, b| b.created_at <=> a.created_at })
      end

      it "recommendに変遷する" do
        get :recommend
        expect(response).to render_template :recommend
      end
    end

    context "ログインしていない場合" do
      it "サインインページに変遷する" do
        get :recommend
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end