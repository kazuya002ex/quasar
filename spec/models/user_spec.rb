require 'rails_helper'

RSpec.describe User, type: :model do
  # ユーザー名のバリデーション
  context 'ユーザー名を空でサインアップした場合' do
    user = User.new(name: nil)
    user.valid?

    it '無効になる' do
      expect(user.errors.full_messages).to include('ユーザー名を入力してください')
      expect(user).to_not be_valid
    end
  end

  context 'ユーザー名が25文字を超える場合' do
    user = User.new(name: 'a' * 26)
    user.valid?

    it '無効になる' do
      expect(user.errors.full_messages).to include('ユーザー名は25文字以内で入力してください')
      expect(user).to_not be_valid
    end
  end

  # メールアドレスのバリデーション
  context 'メールアドレスを空でサインアップした場合' do
    user = User.new(email: nil)
    user.valid?

    it '無効になる' do
      expect(user.errors.full_messages).to include('メールアドレスを入力してください')
      expect(user).to_not be_valid
    end
  end

  context '既に存在するメールアドレスを入力した場合' do
    user = User.create(
      name: 'name1',
      email: 'aaaa2@gmail.com',
      password: 'password',
    )

    user = User.new(
      name: 'name2',
      email: 'aaaa2@gmail.com',
      password: 'password',
    )
    user.valid?

    it '無効になる' do
      expect(user.errors.full_messages).to include('メールアドレスはすでに存在します')
      expect(user).to_not be_valid
    end
  end
end