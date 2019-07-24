class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.valid?
      @post.save

      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save
    redirect_to @post
  end

  private

  def post_params
    params.require(:post).permit(:content, :title, :blogger_id, :destination_id)
  end
end
