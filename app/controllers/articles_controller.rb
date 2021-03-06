# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @articles = Article.order(created_at: 'desc')
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      success(text: '記事を作成しました')
      redirect_to @article
    else
      flash[:alert] = 'not save news'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      success
      redirect_to @article
    else
      flash[:alert] = 'not update news'
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      success
      redirect_to @article
    else
      flash[:alert] = 'not delete news'
      render 'show'
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :content, :news_type)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
