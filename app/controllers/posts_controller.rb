class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
    @post = Post.new
  end

  def new
    @post - Post.new
  end

  def create
    Post.create(post_params)
    redirect_to '/posts'
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