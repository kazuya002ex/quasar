require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  # GETメソッド
  context '#index ユーザーが存在する場合' do
    it 'リクエストが成功すること' do
      get :index
      expect(response.status).to eq 200
    end

    it 'indexテンプレートで表示されること' do
      get :index
      expect(response).to render_template :index
    end
  end

  context '#show 小説が存在する場合' do
    it 'リクエストが成功すること' do
      get :show, params: { id: 1 }
      expect(response.status).to eq 200
    end

    it 'showテンプレートで表示されること' do
      get :show, params: { id: 1 }
      expect(response).to render_template :show
    end
  end

  context '#show 小説が存在しない場合' do
    subject { -> { get :show, params: { id: 999999999999999 } } }

    it { is_expected.to raise_error ActiveRecord::RecordNotFound }
  end
end