class Contributor::PostsController < ApplicationController
    before_action :authenticate_contributor!, exept: [:index]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.contributor_id = current_contributor.id
    if @post.save
      redirect_to contributor_post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @recipients = @post.requesters
    @room = Room.new
  end

  def index
    @contributor = current_contributor
    @posts = @contributor.posts.all.order(updated_at: :desc).page(params[:page]).per(15)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to contributor_post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to contributor_posts_path
    else
      render :show
    end
  end

    def search
    @posts = current_contributor.posts.all.search_contributor_post(params[:title], params[:prefecture], params[:genre],params[:status]).page(params[:page]).per(15)
    render :index
  end

  private
  def post_params
    params.require(:post).permit(:title, :genre, :content, :post_image, :status, :prefecture)
  end

end
