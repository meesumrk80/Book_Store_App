Rails.application.routes.draw do
  devise_for :users

  # Root page
  root "books#index"

  # Static pages
  get "/shared/about", to: "application#about"
  get "/shared/contact", to: "application#contact"
  # post "/contact", to: "pages#send_message"

  # Cart
  resource :cart, only: :show
  resources :cart_items, only: [ :destroy ]

  # Categories
  resources :categories, only: [ :index, :show ]

  # Books & Reviews
  resources :books do
    member do
      post "add_to_cart", to: "cart_items#create"
    end
    resources :reviews, only: [ :create, :destroy, :edit ]
  end

  # Admin namespace
  namespace :admin do
    resources :books
    resources :reviews
  end
end
