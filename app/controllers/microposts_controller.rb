# frozen_string_literal: true

class MicropostsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    post_closed(@post)

    @micropost = Micropost.new(micropost_params)
    @micropost.user_id = current_user.id
    @micropost.post_id = @post.id
    if @micropost.save
      success(text: '1行小説を作成しました')
      redirect_back(fallback_location: root_path)
    else
      error(text: '1行作成に失敗しました')
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    post_closed(@micropost.post)

    @micropost.destroy
    redirect_back(fallback_location: root_path)
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def post_closed(post)
      if post.closed
        error(text: 'この作品は新規の書き込みを停止しています')
        redirect_back(fallback_location: root_path)
      end
    end
end
