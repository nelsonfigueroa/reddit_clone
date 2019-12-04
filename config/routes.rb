# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get '/technologies/', to: 'home#technologies'

  devise_for :users
  resources :users, only: [:show]

  resources :forums do
    resources :posts, only: %i[show new create]
  end

  resources :votes, only: %i[create update destroy]
  resources :comments, only: [:create]
end
