class Recipient::PostsController < ApplicationController
  def index
    @posts = Post.where(status: '非公開')
  end

  def show
    @post = Post.find(params[:id])
    @contributor = @post.contributor
  end
end
