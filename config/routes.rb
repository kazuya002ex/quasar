Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  resources :users, only: [:index, :show]

  resources :posts do
    resources :microposts, only: [:create, :destroy]
    post :confirm, action: :confirm_new, on: :new

    post 'add', to: 'likes#create'
    delete '/add', to: 'likes#destroy'
  end

  resources :users, only: [:index, :show]
  resources :novels, only: [:show]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :articles

  # 静的ページ
  get '/lp', to: 'static#lp'
end
