require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context '#index ユーザーが存在する場合' do
    let(:users) { FactoryBot.create_list :user, 2 }

    it 'リクエストが成功すること' do
      get :index
      expect(response.status).to eq 200
    end

    it 'indexテンプレートで表示されること' do
      get :index
      expect(response).to render_template :index
    end
  end
end