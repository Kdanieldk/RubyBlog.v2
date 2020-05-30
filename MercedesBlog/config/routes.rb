Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
  resources :posts
  resources :image, only: [:create, :destroy]
  resources :tags, only: [:show]

end
