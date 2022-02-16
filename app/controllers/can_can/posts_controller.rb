class CanCan::PostsController < ApplicationController
  def index
    @posts = Post.accessible_by(current_ability)
  end

  def show
    @post = Post.find(params[:id].to_i)
    authorize! :read, @post
  end

  def destroy
    @post = Post.find(params[:id].to_i)
    authorize! :destroy, @post
    @post.destroy
    redirect_to can_can_posts_path, flash: { warning: "Post has been successfully deleted" }
  end
end
