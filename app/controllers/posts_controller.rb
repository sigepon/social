class PostsController < ApplicationController
  def index
    # @posts = Post.all
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end

  def create
      @post = Post.new(post_params)
      @post.save
      redirect_to root_path
  end

  def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
  end

  private

  def post_params
      params.require(:post).permit(:body, :picture)
  end
end
