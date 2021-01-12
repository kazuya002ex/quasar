class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(id: "DESC")
    # top-raiking
    @ranking_posts = Post.rank
    #top-new-arrival
    @new_arrival_posts = Post.new_arriv
  end

  def show
    # ページが表示されたら閲覧数を増やす
    post_browsing = @post.browsing + 1
    @post.update(browsing: post_browsing)

    @microposts = @post.microposts.order(id: "DESC")
    @micropost = Micropost.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
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

  # def confirm_new
  #   @post = current_user.posts.new(post_params)
  #   render :new unless @post.valid?
  # end

  private

    def post_params
      params.require(:post).permit(:title, :story, :order, :image)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
