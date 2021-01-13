require 'rails_helper'

RSpec.describe Post, type: :model do
  # タイトルのバリデーション
  context 'タイトルが空の場合' do
    post = Post.new(title: nil)
    post.valid?
    
    it '無効になる' do
      expect(post.errors.full_messages).to include('Titleを入力してください')
      expect(post).to_not be_valid
    end
  end

  context 'タイトルが32文字を超える場合' do
    post = Post.new(title: '僕が恋をしたのは彼女ではなく彼女の持つ才能とそれに嫉妬する僕の感情')
    post.valid?

    it '無効になる' do
      expect(post.errors.full_messages).to include('Titleは32文字以内で入力してください')
      expect(post).to_not be_valid
    end
  end
end