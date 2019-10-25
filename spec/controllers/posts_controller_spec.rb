require 'rails_helper'

describe PostsController do
  let(:user) { create(:user) }
  let(:content_post) { build(:post) }
  let(:params) { { post: { text: content_post.text, created_at: content_post.created_at, user_id: user.id, tasks_attributes: ["12時間", "html"]  }} }

  describe 'GET #index' do

    it "indexページに変遷する" do
      get :index
      expect(response).to render_template :index
    end
    
    it "@postsの値が適切" do
      posts = create_list(:post, 3) 
      get :index
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at })
    end

    context "ログインしている場合" do
      before do
        login_user user
      end

      it "@recommendusersの値が適切" do
        recommendusers = create_list(:user, 3)
        get :index
        expect(assigns(:recommendusers)).to match(recommendusers.sort{ |a, b| b.created_at <=> a.created_at })
      end
    end


    context "ログインしていない場合" do

      it "@recommendusersの値が適切" do
        recommendusers = create_list(:user, 3)
        get :index
        expect(assigns(:recommendusers)).to match(recommendusers.sort{ |a, b| b.created_at <=> a.created_at })
      end
    end

  end

  describe 'GET #new' do

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

  describe 'POST #create' do

  context "ログインしている場合" do
    before do
      login_user user
    end

    it "postが生成される" do
      expect do
        post :create, params: params
      end.to change(Post, :count).by(1)
    end

    it "トップページに変遷する" do
      get :create, params: params
      expect(response).to redirect_to root_path
    end

  end


  context "ログインしていない場合" do

    it "サインインページに変遷する" do
      post :create
      expect(response).to redirect_to new_user_session_path
    end

  end

end

  describe 'GET #show' do

  it "@userの値が適切" do
    post = create(:post)
    post_user_id = post.user_id
    get :show, params: { id: post }
    expect(post_user_id).to eq user.id
  end
  
  let(:user) { create(:user,id: 1) }
    before do
      login_user user
    end

    it "@postsの値が適切" do
      post = create(:post)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it "詳細ページに変遷する" do
      post = create(:post)
      get :show, params: { id: post }
      expect(response).to render_template :show
    end

  end

  describe 'GET #destroy' do
  
  let(:user) { create(:user) }
  before do
    login_user user
  end

  it "投稿を削除する" do
    post = create(:post,user_id:user.id)
    expect{
      delete :destroy, params: {id: post}
    }.to change(Post,:count).by(-1)
  end


  end

end