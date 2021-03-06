require 'rails_helper'
# frozen_string_literal: true

RSpec.describe Article, type: :model do
  context 'タイトルが空の場合' do
    article = Article.new(title: nil)
    article.valid?

    it '無効になる' do
      expect(article.errors.full_messages).to include('Titleを入力してください')
      expect(article).to_not be_valid
    end
  end

  context 'タイトルが30文字を超える場合' do
    article = Article.new(title: '今回の変更はあなたの人生を変える、、、、いや、、、、そんな生優しいものじゃあらへんで、、、わかったか？')
    article.valid?
    
    it '無効になる' do
      expect(article.errors.full_messages).to include('Titleは30文字以内で入力してください')
      expect(article).to_not be_valid
    end
  end

  context 'コンテンツが空の場合' do
    article = Article.new(content: nil)
    article.valid?

    it '無効になる' do
      expect(article.errors.full_messages).to include('Contentを入力してください')
      expect(article).to_not be_valid
    end
  end

  context 'コンテンツが500文字を超える場合' do
    article = Article.new(content: 'もめ' * 251)
    article.valid?

    it '無効になる' do
      expect(article.errors.full_messages).to include('Contentは500文字以内で入力してください')
      expect(article).to_not be_valid
    end
  end

  context 'タイプが空の場合' do
    article = Article.new(news_type: nil)
    article.valid?

    it '無効になる' do
      expect(article.errors.full_messages).to include('News typeを入力してください')
      expect(article).to_not be_valid
    end
  end
end
