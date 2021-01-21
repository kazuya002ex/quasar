require 'rails_helper'

RSpec.describe MicropostsController, type: :controller do
  let(:makoto) { FactoryBot.create :makoto }
  let!(:post) { FactoryBot.create :post }
  # let!(:micropost1_1) { create(:micropost1_1, post: post) }
  before { login_user makoto }

  context '#create ユーザーが存在する場合' do
    xit 'リクエストが成功すること' do
      post :create, params: { micropost: FactoryBot.attributes_for(:micropost) }
      expect(response.status).to eq 302
    end

    xit '文章が作成されること' do
      expect do
        post :create, params: { micropost: FactoryBot.attributes_for(:micropost) }
      end.to change(Micropost, :count).by(1)
    end

    xit 'リダイレクトすること' do
      post :create, params: { micropost: FactoryBot.attributes_for(:micropost) }
      expect(response).to redirect_to Micropost.last
    end
  end
end
