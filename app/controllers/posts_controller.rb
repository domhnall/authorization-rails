class PostsController < ApplicationController
  before_action :set_selected_tab

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id].to_i)
  end

  def destroy
    @post = Post.find(params[:id].to_i)
    @post.destroy
    redirect_to posts_path, flash: { warning: "Post has been successfully deleted" }
  end

  private

  def set_selected_tab
    @selected_tab = "no_auth"
  end
end
