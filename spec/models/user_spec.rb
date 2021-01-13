require 'rails_helper'

RSpec.describe User, type: :model do
  context '正しい形式で入力した場合' do
    user = User.new(
        name: "name1",
        email: "aaaa1@gmail.com",
        password: "password",
    )

    it 'サインアップできる' do
      expect(user).to be_valid
    end
  end

  context 'ユーザー名を空でサインアップした場合' do
    user = User.new(name: nil)
    user.valid?

    it '無効になる' do
      expect(user.errors.full_messages).to include("ユーザー名を入力してください")
      expect(user).to_not be_valid
    end
  end

  context 'ユーザー名が25文字を超える場合' do
    user = User.new(name: 'a' * 26)
    user.valid?

    it '無効になる' do
      expect(user.errors.full_messages).to include("ユーザー名は25文字以内で入力してください")
      expect(user).to_not be_valid
    end
  end
end