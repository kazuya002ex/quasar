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
end