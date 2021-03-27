require 'rails_helper'

RSpec.describe FreeComment, type: :model do

  #contentのバリデーション

  describe content do
    context '文章が空の場合' do
      free_comment = FreeComment.new(content: nil)
      free_comment.valid?

      it '無効になる' do
        expect(free_comment.errors.full_messages).to include('Contentを入力してください')
        expect(free_comment).to_not be_valid
      end
    end
  
    context '55文字以上の場合' do
      long_content = '僕が恋をしたのは彼女ではなく彼女の持つ才能とそれに嫉妬する僕の感情を抑えきれないに君を愛すのならば、僕は君以外の魂とアトロポシーを切り捨てて眺めていたい'
      free_comment = FreeComment.new(content: long_content)
      free_comment.valid?

      it '無効になる' do
        expect(free_comment.errors.full_messages).to include('Contentを入力してください')
        expect(free_comment).to_not be_valid
      end
    end
  end

  #usernameのバリデーション

  describe username do
    context '文章が空の場合' do
      free_comment = FreeComment.new(username: nil)
      free_comment.valid?

      it '無効になる' do
        expect(free_comment.errors.full_messages).to include('usernameを入力してください')
        expect(free_comment).to_not be_valid
      end
    end
  
    context '25文字以上の場合' do
      long_username = '僕が恋をしたのは彼女ではなく彼女の持つ才能とそれに嫉妬する僕の感情'
      free_comment = FreeComment.new(username: long_username)
      free_comment.valid?

      it '無効になる' do
        expect(free_comment.errors.full_messages).to include('usernameを入力してください')
        expect(free_comment).to_not be_valid
      end
    end 
end
