class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.tasks.build
    render "new"
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to controller: :posts, action: :index
    else
      # render "new"
      redirect_to root_path
    end
  end

  def show
    @post = Post.find(params[:id])
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



  private

  def post_params
    params.require(:post).permit(:text,tasks_attributes: [:time,:language]).merge(user_id: current_user.id)
  end

  def task_params
    params.require(:post).permit(:tasks_attributes).merge(post_id: 1)
  end
end
