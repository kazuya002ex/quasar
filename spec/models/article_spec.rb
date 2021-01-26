require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'タイトルが空の場合' do
    article = Article.new(title: nil)
    article.valid?

    it '無効になる' do
      expect(article.errors.full_messages).to include('Titleを入力してください')
      expect(article).to_not be_valid
    end
  end

  context 'タイトルが32文字を超える場合' do
    article = Article.new(title: '今回の変更はあなたの人生を変える、、、、いや、、、、そんな生優しいものじゃあらへんで、、、わかったか？')
    article.valid?
    
    it '無効になる' do
      expect(article.errors.full_messages).to include('Titleは32文字以内で入力してください')
      expect(article).to_not be_valid
    end
  end
end
