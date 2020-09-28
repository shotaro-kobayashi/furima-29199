Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :posts
  resources :products do
    resources :users
  end
  
end
