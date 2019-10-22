class UsersController < ApplicationController
  before_action :authenticate_user!,       only:[:recommend]

  
  def show
    @user = User.find_by(id: params[:id])
  end

  def update
  end

  def recommend
    @recommendusers = User.where.not(id: current_user.id).order("created_at DESC").limit(10)
  end
end
