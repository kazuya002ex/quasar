class ClosedPostsController < ApplicationController

  def update
    @post = Post.find(params[:id])
    if @post.update(closed: true)
      success(text: '作品への書き込みを停止しました')
      redirect_to @post
    else
      error(text: '作品への書き込み停止に失敗しました（停止の処理は完了していません）')
      render :edit
    end
  end
end
