# frozen_string_literal: true

class MicropostsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])

    if @post.closed
      flash[:alert] = 'この作品は新規の書き込みを停止しています'
      redirect_back(fallback_location: root_path)
    end

    @micropost = Micropost.new(micropost_params)
    @micropost.user_id = current_user.id
    @micropost.post_id = @post.id
    if @micropost.save
      success
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = '1行作成に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_back(fallback_location: root_path)
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
