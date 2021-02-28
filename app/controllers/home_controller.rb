class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :top

  def top
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(id: "DESC")

    # top-article
    # TODO: 最新の4件を取得する
    @sample_article = Article.first

    # top-raiking
    @ranking_posts = Post.rank
    #top-new-arrival
    @new_arrival_posts = Post.new_arriv
  end
end
