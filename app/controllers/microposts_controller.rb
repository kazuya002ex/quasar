class MicropostsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @microposts = @post.microposts
  	@micropost = Micropost.new(micropost_params)
    @micropost.user_id = current_user.id
    @micropost.post_id = @post.id
    if @micropost.save
      redirect_back(fallback_location: root_path)
    else
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
