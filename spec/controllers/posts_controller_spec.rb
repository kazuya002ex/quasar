require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:makoto) { FactoryBot.create :makoto }
  before { login_user makoto }

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

  context '#new ユーザーが存在するとき' do
    it 'リクエストが成功すること' do
      get :new
      expect(response.status).to eq 200
    end

    it 'newテンプレートで表示されること' do
      get :new
      expect(response).to render_template :new
    end
  end

  # POSTメソッド
  context '#create ユーザーが存在する場合' do
    it 'リクエストが成功すること' do
      post :create, params: { post: FactoryBot.attributes_for(:post) }
      expect(response.status).to eq 302
    end

    it '投稿が作成されること' do
      expect do
        post :create, params: { post: FactoryBot.attributes_for(:post) }
      end.to change(Post, :count).by(1)
    end

    it 'リダイレクトすること' do
      post :create, params: { post: FactoryBot.attributes_for(:post) }
      expect(response).to redirect_to Post.last
    end
  end

  context '#create パラメータが不正の場合' do
    it 'リクエストが成功すること' do
      post :create, params: { post: FactoryBot.attributes_for(:post, :invalid) }
      expect(response.status).to eq 200
    end

    it 'newテンプレートで表示されること' do
      post :create, params: { post: FactoryBot.attributes_for(:post, :invalid) }
      expect(response).to render_template :new
    end

    it 'エラーが表示されること' do
      post :create, params: { post: FactoryBot.attributes_for(:post, :invalid) }
      expect(assigns(:post).errors.any?).to be_truthy
    end
  end

  context '#update ユーザーが存在するとき' do
    
  end

  context '#destroy ユーザーが存在するとき' do
    
  end
end
