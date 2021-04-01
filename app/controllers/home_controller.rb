class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :top

  def top
    # top-article
    @articles = Article.latest_news

    # top-raiking
    @ranking_posts = Post.rank
    #top-new-arrival
    @new_arrival_posts = Post.new_arriv
  end
end
