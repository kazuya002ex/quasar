require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context '#show ユーザーが存在する場合' do
    let(:makoto) { FactoryBot.create :makoto }
    
    it 'リクエストが成功すること' do
      get :show, params: { id: makoto }
      expect(response.status).to eq 200
    end

    it 'showテンプレートで表示されること' do
      get :show, params: { id: makoto }
      expect(response).to render_template :show
    end

    it '@userが取得できていること' do
      get :show, params: { id: makoto }
      expect(assigns :user).to eq makoto
    end
  end

  context '#show ユーザーが存在しない場合' do
    subject { -> { get :show, params: { id: 999999999999999 } } }

    it { is_expected.to raise_error ActiveRecord::RecordNotFound }
  end
end