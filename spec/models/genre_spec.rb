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
end
