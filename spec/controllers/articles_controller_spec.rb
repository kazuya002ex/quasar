require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:makoto) { create(:makoto) }
  before { login_user makoto }

  # GETメソッド
  xcontext '#show' do
    it 'リクエストが成功すること' do
      get :show, params: { id: 1 }
      expect(response).to eq 200
    end

    it 'showテンプレートで表示されること' do
      get :show, params: { id: 1 }
      expect(response).to render_template :show
    end
  end
end