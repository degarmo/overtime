class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  def index
    @posts =  Post.all.limit(25)
  end

  def new
      @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to @post, notice: 'Your Post Was Created!'
    else
      render :new
    end
  end

  def show

  end

  def edit
    set_post
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Your post was updated!"
    else
      render :edit
    end
  end


  def destory

  end


private

  def post_params
    params.require(:post).permit(:date, :rational)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
