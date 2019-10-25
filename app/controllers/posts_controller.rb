class PostsController < ApplicationController
  before_action :authenticate_user!,       only:[:new,:create]
  before_action :set_posts,                only:[:show,:destroy]

  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(5)
    if user_signed_in?
      @recommendusers = User.order("created_at DESC").limit(3).where.not(id:current_user.id)
    else
      @recommendusers = User.order("created_at DESC").limit(3)
    end

  end

  def new
    @post = Post.new
    @post.tasks.build
    render "new"
  end

  def create
    @post = Post.new(post_params)
    if params[:post][:tasks_attributes]["0"][:time] == "" || params[:post][:tasks_attributes]["0"][:language] == ""
      @post = Post.new
      @post.tasks.build
      render "new"
    else
      if @post.save
        redirect_to controller: :posts, action: :index
      else
        @post = Post.new
        @post.tasks.build
        render "new"
      end
    end
  end

  def show
    @user = User.find(@post.user_id)
    @chart = Task.where(post_id: params[:id]).pluck("language","time")
    #合計の勉強
    @posttimes = Task.where(post_id: params[:id])
    times =[]
    @posttimes.each do |posttime|
      time = posttime.time_before_type_cast
      times << time
    end
    @time_sum = times.sum

  end

  def destroy
    @post.destroy if @post.user_id == current_user.id
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:text,tasks_attributes: [:time,:language]).merge(user_id: current_user.id)
  end

  def set_posts
    @post = Post.find(params[:id])
  end
end
