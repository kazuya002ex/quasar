class NovelsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
  	@post = Post.find(params[:id])
  	@microposts = @post.microposts
  end
end
