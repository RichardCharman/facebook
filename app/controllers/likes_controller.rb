class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    Like.create(post: @post)
    redirect_to posts_path
  end

end