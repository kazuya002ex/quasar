require 'rails_helper'

RSpec.describe Micropost, type: :model do
  # 文章のバリデーション
  context '文章が空の場合' do
    micropost = Micropost.new(content: nil)
    micropost.valid?

    it '無効になる' do
      expect(micropost.errors.full_messages).to include('Contentを入力してください')
      expect(micropost).to_not be_valid
    end
  end

  context '文章が55文字を超える場合' do
    long_content = '僕が恋をしたのは彼女ではなく彼女の持つ才能とそれに嫉妬する僕の感情を抑えきれないに君を愛すのならば、僕は君以外の魂とアトロポシーを切り捨てて眺めていたい'
    micropost = Micropost.new(content: long_content)
    micropost.valid?

    it '無効になる' do
      expect(micropost.errors.full_messages).to include('Contentは55文字以内で入力してください')
      expect(micropost).to_not be_valid
    end
  end
end
