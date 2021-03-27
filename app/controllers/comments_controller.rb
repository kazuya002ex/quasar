
class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @free_comment.post_id = @post.id

    if user_signed_in?
      @free_comment = FreeComment.new(content: params[:content])
      @free_comment.username = current_user.name
    else
      @free_comment = FreeComment.new(free_comment_params)
    end

    if @free_comment.save
      success
      redirect_to @post
    else
      flash[:alert] = 'コメント作成に失敗しました'
      render 'posts/show'
    end
  end

  private

    def free_comment_params
      params.require(:free_comment).permit(:content, :username)
    end
end
