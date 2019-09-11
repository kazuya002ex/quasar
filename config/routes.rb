Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'posts#index'
  resources :users, only: [:index, :show]
  resources :posts do
  	resources :microposts, only: [:create, :destroy]
  	post :confirm, action: :confirm_new, on: :new
  end
  resources :users, only: [:index, :show]
  resources :novels, only: [:show]
end
