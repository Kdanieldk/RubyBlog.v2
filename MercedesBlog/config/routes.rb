Rails.application.routes.draw do

  root 'posts#index'
  resources :posts
  resources :image, only: [:create, :destroy]
  resources :tags, only: [:show]
end
