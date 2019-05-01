Rails.application.routes.draw do
  root 'home#index'
  get 'home/technologies'

  devise_for :users

  resources :subs do
    resources :posts, only: [ :show, :new, :create ]
  end

  resources :upvotes, only: [ :create, :destroy ]
  resources :downvotes, only: [ :create, :destroy ]
end
