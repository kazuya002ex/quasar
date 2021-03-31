class MicropostStarsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    micropost = Micropost.first # TODO: 後で指定したMicropostの取得に変更する
    user = current_user || nil
    micropost_star = MicropostStar.new(micropost: micropost, user: user)

    ActiveRecord::Base.transaction do
      micropost_star.save!
      micropost.update!(star_count: micropost.micropost_star.count)
    end

    redirect_to @post
  end
end
