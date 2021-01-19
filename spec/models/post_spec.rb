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

  # ストーリーのバリデーション
  context 'ストーリーが空の場合' do
    post = Post.new(story: nil)
    post.valid?
    
    it '無効になる' do
      expect(post.errors.full_messages).to include('Storyを入力してください')
      expect(post).to_not be_valid
    end
  end

  context 'ストーリーが300文字を超える場合' do
    post = Post.new(story: 'ごめん' * 100 + 'え')
    post.valid?

    it '無効になる' do
      expect(post.errors.full_messages).to include('Storyは300文字以内で入力してください')
      expect(post).to_not be_valid
    end
  end

  # オーダーのバリデーション
  context 'オーダーが空の場合' do
    post = Post.new(order: nil)
    post.valid?
    
    it '無効になる' do
      expect(post.errors.full_messages).to include('Orderを入力してください')
      expect(post).to_not be_valid
    end
  end

  context 'オーダーが300文字を超える場合' do
    post = Post.new(order: 'ごめん' * 100 + 'え')
    post.valid?

    it '無効になる' do
      expect(post.errors.full_messages).to include('Orderは300文字以内で入力してください')
      expect(post).to_not be_valid
    end
  end

  # scopeの取得
  context 'new_arrivを使用した場合' do
    test_posts = 10.times do |n|
      Post.create!(
        title: 'タイトル',
        story: 'ストーリー説明',
        order: '素敵なストーリーにしてください。',
        user_id: 1
        )
    end

    posts = Post.new_arriv

    it '10件取得する' do
      expect(posts.count).to eq 10
    end
  end
end
