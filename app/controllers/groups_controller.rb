class GroupsController < ApplicationController
  def new
    @users = User.where.not(id: current_user.id).page(params[:page]).per(10)

  end
  def create
    @current_user_group_id = GroupUser.where(user_id: current_user.id).pluck('group_id')
    @params_user_group_id = GroupUser.where(user_id: params[:user_id]).pluck('group_id')
    @common_group_id_hairetu = @current_user_group_id & @params_user_group_id
    @common_group_id = @common_group_id_hairetu[0]
    if @common_group_id.nil?
    @group = Group.new
    @group.users << current_user
    @group.users << User.find(params[:user_id])
    @group.save
    redirect_to "/groups/new"
    else
      redirect_to "/groups/#{@common_group_id}/messages"
    end

  
  end
end
