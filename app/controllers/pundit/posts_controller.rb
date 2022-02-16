class Pundit::PostsController < ApplicationController
  include Pundit::Authorization
  before_action :set_selected_tab

  def index
    @posts = policy_scope(Post)
  end

  def show
    @post = Post.find(params[:id].to_i)
    authorize @post
  end

  def destroy
    @post = Post.find(params[:id].to_i)
    authorize @post
    @post.destroy
    redirect_to pundit_posts_path, flash: { warning: "Post has been successfully deleted" }
  end

  private

  def set_selected_tab
    @selected_tab = "pundit"
  end
end
