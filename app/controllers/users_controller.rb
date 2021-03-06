# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def index
    @users = User.rand
  end

  def show
    @user = User.find(params[:id])
    # 依頼作品
    @request_posts = Post.my_request(@user)
    # 執筆作品(仮)
    @writing_posts = Post.order(Arel.sql('rand()')).limit(6)

    # もともとダイレクトメッセージの機能として使っていた
    # if user_signed_in?
      # @currentUserEntry=Entry.where(user_id: current_user.id)
      # @userEntry=Entry.where(user_id: @user.id)
      # if @user.id == current_user.id
      # else
      #   @currentUserEntry.each do |cu|
      #     @userEntry.each do |u|
      #       if cu.room_id == u.room_id then
      #         @isRoom = true
      #         @roomId = cu.room_id
      #       end
      #     end
      #   end
      #   if @isRoom
      #   else
      #     @room = Room.new
      #     @entry = Entry.new
      #   end
      # end
    # end
  end
end
