Rails.application.routes.draw do
  devise_for :users
  get 'posts', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  resources :products
  resources :posts, only: :index
end
