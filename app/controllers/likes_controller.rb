# frozen_string_literal: true

class LikesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    like = Like.new(user_id: current_user.id, post_id: post.id)
    redirect_back(fallback_location: root_path) if like.save
  end

  def destroy
    post = Post.find(params[:post_id])
    like = Like.find_by(user_id: current_user.id, post_id: post.id)
    redirect_back(fallback_location: root_path) if like.destroy
  end
end
