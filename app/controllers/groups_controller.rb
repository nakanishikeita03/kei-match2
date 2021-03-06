class GroupsController < ApplicationController
before_action :authenticate_user!,       only:[:new,:create]

  def new
    @followingrelationship = Relationship.where(user_id:current_user.id).select('follow_id')
    @followingusers = User.where(id:@followingrelationship) 
    @followerrelationship = Relationship.where(follow_id:current_user.id).select('user_id')
    @followerusers = User.where(id:@followerrelationship) 
    @matchingusers = @followingusers & @followerusers
    @users = Kaminari.paginate_array(@matchingusers).page(params[:page]).per(10)
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
        redirect_to "/groups/#{@group.id}/messages"
      else
        redirect_to "/groups/#{@common_group_id}/messages"
      end
  end

end
