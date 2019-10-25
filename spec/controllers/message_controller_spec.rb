require 'rails_helper'

describe MessagesController do
  let(:user) { create(:user) }
  let(:content_message) { build(:message) }

  describe 'GET #index' do

    context "ログインしている場合" do

      before do
        login_user user
      end

      it "indexに変遷する" do
        user2 = create(:user)
        group = create(:group)
        get :index, params: { group_id: group.id }
        expect(response).to render_template :index
      end

      it "@groupの値が適切" do
          group = create(:group)
          get :index, params: { group_id: group.id }
          expect(assigns(:group)).to eq group
      end

      it "@messageの値が適切" do
        group = create(:group)
        messages = create_list(:message, 3, group_id: group.id, user_id: user.id)
        get :index, params: { group_id: group.id }
        expect(assigns(:messages)).to eq messages
      end

    end

    context "ログインしていない場合" do

      it "indexに変遷する" do
        user2 = create(:user)
        group = create(:group)
        get :index, params: { group_id: group.id }
        expect(response).to redirect_to new_user_session_path
      end

    end
  end



  describe 'GET #create' do

    context "ログインしている場合" do

        before do
          login_user user
        end

        it "messageが生成される" do
          group = create(:group)
          expect do
            post :create, params: {message: { content: content_message.content},group_id: group.id}
          end.to change(Message, :count).by(1)
        end

        it "トップページに変遷する" do
          group = create(:group)
          get :create, params: {message: { content: content_message.content},group_id: group.id}
          expect(response).to redirect_to group_messages_path(group)
        end
    end

    context "ログインしていない場合" do

      it "トップページに変遷する" do
        group = create(:group)
        get :create, params: {message: { content: content_message.content},group_id: group.id}
        expect(response).to redirect_to new_user_session_path
      end

    end

  end

end