class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  	  redirect_to root_path
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
  	@post.destroy
  	redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :story, :order)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
