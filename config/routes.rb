Rails.application.routes.draw do
  devise_for :users
  # Add other routes as needed


  resources :books, only: [ :index, :show ] do
  post "add_to_cart", to: "cart_items#create"
  end

  resource :cart, only: :show
  resources :cart_items, only: [ :destroy ]
  root "books#index"
  # Admin namespace
  namespace :admin do
    resources :books
  end
end
