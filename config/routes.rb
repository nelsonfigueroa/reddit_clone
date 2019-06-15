# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get 'home/technologies'

  devise_for :users
  resources :users, only: [:show]

  resources :subs do
    resources :posts, only: %i[show new create]
  end

  resources :votes, only: %i[create update destroy]
  resources :comments, only: [:create]
end
