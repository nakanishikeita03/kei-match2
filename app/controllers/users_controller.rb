class UsersController < ApplicationController
  before_action :authenticate_user!,       only:[:recommend]
  def index
    if user_signed_in?
      @users = User.where("name LIKE(?) && #{params[:keyword].present?}","%#{params[:keyword]}%").where.not(id: current_user.id)
    else
      @users = User.where("name LIKE(?) && #{params[:keyword].present?}","%#{params[:keyword]}%")
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def update
  end

  def recommend
    @recommendusers = User.where.not(id: current_user.id).order("created_at DESC").limit(10)
  end
end
