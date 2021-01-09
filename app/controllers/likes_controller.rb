class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    post = Post.find(params[:post_id])
    like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    redirect_back(fallback_location: root_path) if like.save
  end

  def destroy
    post = Post.find(params[:post_id])
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    redirect_back(fallback_location: root_path) if like.destroy
  end

  private

    def post_set
      @post = Post.find(params[:id])
    end
end
