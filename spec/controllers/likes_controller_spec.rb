require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:makoto) { FactoryBot.create :makoto }
  before { login_user makoto }
  let(:yuuki) { FactoryBot.create :yuuki }
  before { login_user yuuki }

  # POSTメソッド
  context '#create ユーザーが存在する場合' do
    xit 'リクエストが成功すること' do
      post :create, params: { like: FactoryBot.attributes_for(:like) }
      expect(response.status).to eq 302
    end

    xit 'いいねが作成されること' do
      expect do
        post :create, params: { like: FactoryBot.attributes_for(:like) }
      end.to change(Post, :count).by(1)
    end

    xit 'リダイレクトすること' do
      post :create, params: { like: FactoryBot.attributes_for(:like) }
      expect(response).to redirect_to Like.last
    end
  end
end
