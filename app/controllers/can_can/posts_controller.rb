class CanCan::PostsController < ApplicationController
  before_action :set_selected_tab

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

  private

  def set_selected_tab
    @selected_tab = "can_can"
  end
end
