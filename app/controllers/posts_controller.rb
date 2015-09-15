class PostsController < ApplicationController

   before_action :authenticate_user!, :except => [:show]

  def index
    @posts = Post.all.reverse
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:notice] = 'Status must contain at least one character'
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Status deleted'
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:status)
  end
end