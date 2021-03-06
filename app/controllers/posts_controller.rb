# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # top-raiking
    @ranking_posts = Post.rank
    #top-new-arrival
    @new_arrival_posts = Post.new_arriv
  end

  def show
    # ページが表示されたら閲覧数を増やす
    browsing_count(@post)

    @microposts = @post.microposts.order(id: "DESC")
    @micropost = Micropost.new

    @free_comments = @post.free_comments.order(id: "DESC")
    @free_comment = FreeComment.new
    @default_name = '名無しのリライアーさん'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # TODO: 中間テーブルにレコードを作成？
    if @post.valid?
      ActiveRecord::Base.transaction do
        @post.save_genres(params[:post][:genre_ids].to_i)  if params[:post][:genre_ids].present?
        if @post.save
          success(text: '小説を作成しました')
          redirect_to @post
        end
      end
    else
      error
      render :new
    end
  end

  def edit
    return if authenticate_author!
  end

  def update
    return if authenticate_author!

    if @post.update(post_params)
      success(text: '小説の内容を編集しました')
      redirect_to @post
    else
      error(text: '小説の編集に失敗しました')
      render :edit
    end
  end

  def destroy
    if @post.destroy
      success
      redirect_to root_path
    else
      error(text: '小説の削除に失敗しました')
      render :show
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :story, :order, :image)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def browsing_count(post)
      post_browsing = post.browsing + 1
      post.update(browsing: post_browsing)
    end

    def authenticate_author!
      unless @post.user == current_user
        error(text: '作成者では無いため、作品の内容を編集できません')
        redirect_to @post
      end
    end
end
