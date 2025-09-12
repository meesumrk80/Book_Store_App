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
  resources :cart_items, only: [ :destroy, :update ]
  resources :orders, only: [ :new, :create, :show ]

  # Categories
  resources :categories, only: [ :index, :show ]

  # Books & Reviews
  resources :books do
    resources :cart_items, only: [ :create, :update, :destroy ]
    resources :reviews, only: [ :create, :destroy, :edit ]
end


  # Admin namespace
  namespace :admin do
    resources :books
    resources :reviews
  end
end
