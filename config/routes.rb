Rails.application.routes.draw do
  #get 'addresses/create'
  devise_for :users
  root to: 'products#index'
  resources :products do
    resources :orders
  end
  #get '/products/:id/transaction', to:'products#transaction', as: 'transaction_product'
  #post '/products/:id/transaction', to:'products#create_transaction', as: 'create_transaction'
end
