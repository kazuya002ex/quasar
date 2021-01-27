require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:makoto) { FactoryBot.create :makoto }
  before { login_user makoto }

  # GETメソッド
  context '#index' do
    it 'リクエストが成功すること' do
      get :index
      expect(response.status).to eq 200
    end

    it 'indexテンプレートが表示されること' do
      get :index
      expect(response).to render_template :index
    end
  end
end