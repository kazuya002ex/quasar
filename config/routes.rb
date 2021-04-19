Rails.application.routes.draw do
  root 'home#top'
  devise_for :users

  resources :posts do
    resources :microposts, only: [:create, :destroy] do
      resources :micropost_stars, only: :create
    end

    resources :free_comments, only: [:create] 

    post :confirm, action: :confirm_new, on: :new
    post 'add', to: 'likes#create'
    delete '/add', to: 'likes#destroy'
  end

  resources :users, only: [:index, :show]
  resources :novels, only: [:show]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
  resources :articles
  resources :closed_posts, only: [:update, :destroy]

  resources :recommend_posts, :index
  resources :new_arrival_posts, :index

  # 静的ページ
  get '/lp', to: 'static#lp'
end
