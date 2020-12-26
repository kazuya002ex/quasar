class LikesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
  end

  private

    def post_set
      @post = Post.find(params[:post_id])
    end
end
