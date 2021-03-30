class RecommendPostsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @posts = Post.rank
  end
end
