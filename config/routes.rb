Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  # get 'posts/new', to: 'posts#new'
  resources :posts
  resources :products do
    resources :users
  end
  
end
