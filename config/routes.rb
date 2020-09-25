Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  
  resources :products
  resources :posts, only: [:index, :new ,:create]
end
