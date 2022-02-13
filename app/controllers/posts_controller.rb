class PostsController < AuthenticatedApplicationController
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
end
