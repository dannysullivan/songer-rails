class Api::PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts
  end

  def create
    post = Post.create(post_params)
    render json: post
  end

  def default_serializer_options
    {root: false}
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
