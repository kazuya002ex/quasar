
class FreeCommentsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    if user_signed_in?
      @free_comment = FreeComment.new(content: params[:free_comment][:content])
      @free_comment.username = current_user.name
    else
      @free_comment = FreeComment.new(free_comment_params)
    end

    @post = Post.find(params[:post_id])
    @free_comment.post_id = @post.id

    if @free_comment.save
      success
      redirect_to @post
    else
      flash[:alert] = 'コメント作成に失敗しました'
      redirect_to @post
    end
  end

  private

    def free_comment_params
      params.require(:free_comment).permit(:content, :username)
    end
end
