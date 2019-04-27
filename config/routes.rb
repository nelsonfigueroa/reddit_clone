Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :subs do
    resources :posts
  end
end
