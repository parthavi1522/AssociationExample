Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show]
  resources :vehicles, only: [:index, :show]
  resources :entries, only: [:index, :show]
  resources :queries, only: [:index]
end
