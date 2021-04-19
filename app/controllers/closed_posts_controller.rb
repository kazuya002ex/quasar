# frozen_string_literal: true

class ClosedPostsController < ApplicationController
  before_action :set_post, only: [:update, :destroy]

  def update
    if @post.update(closed: true)
      success(text: '作品への書き込みを停止しました')
      redirect_to @post
    else
      error(text: '作品への書き込み停止に失敗しました（停止の処理は完了していません）')
      render :edit
    end
  end

  def destroy
    if @post.update(closed: false)
      success(text: '作品への書き込みを開始しました')
      redirect_to @post
    else
      error(text: '作品への書き込み開始に失敗しました（開始できていません）')
      render :edit
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
end
