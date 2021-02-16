require 'rails_helper'

RSpec.describe Genre, type: :model do
  context '名前が空の場合' do
    genre = Genre.new(name: nil)
    genre.valid?

    it '無効になる' do
      expect(genre.errors.full_messages).to include('Nameを入力してください')
      expect(genre).to_not be_valid
    end
  end

  context 'ジャンル名が20文字を超える場合' do
    genre = Genre.new(name: '漆黒に誘われし闇の創生神が降臨し極光の稲妻が啓明するならばお芋')
    genre.valid?
    
    it '無効になる' do
      expect(genre.errors.full_messages).to include('Nameは20文字以内で入力してください')
      expect(genre).to_not be_valid
    end
  end
end
