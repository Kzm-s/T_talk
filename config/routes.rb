Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  ActiveAdmin.routes(self)
  devise_for :users

  root to: 'posts#index'

  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:edit, :update, :create, :destroy]
    resources :likes, only: [:create, :destroy]
    collection do
      get :confirms
    end
    collection do
      get 'search'
    end
  end

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'relationships/followers' => 'relationships#followers', as: 'followers'
    get 'relationships/followings' => 'relationships#followings', as: 'followings'
    member do
      get :followings, :followers
    end

    member do
      get :likes
      get :confirms
    end
  end

  resources :messages, only: [:create]

  resources :rooms, only: [:create, :show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
