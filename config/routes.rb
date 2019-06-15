Rails.application.routes.draw do
  root 'home#index'
  get 'home/technologies'

  devise_for :users
  resources :users, only: [:show]

  resources :subs do
    resources :posts, only: [:show, :new, :create]
  end

  resources :votes, only: [:create, :update, :destroy]
  resources :comments, only: [:create]
end
