class PostsController < ApplicationController
  def index
  end

  def new
    # binding.pry
    @post = Post.new
    @post.task.build
  end

  def create
    # binding.pry
    @post = Post.new(post_params)
    if @post.save
      # binding.pry
      redirect_to controller: :posts, action: :index
    else
      # render "new"
      redirect_to root_path
    end
  end



  private

  def post_params
    params.require(:post).permit(:text,task_attributes: [:time,:language]).merge(user_id: current_user.id)
  end

  def task_params
    params.require(:post).permit(:task_attributes).merge(post_id: 1)
  end
end
