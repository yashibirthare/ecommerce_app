Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products do
    resources :cart_items, only: [:create]
    resources :wishlist_items, only: [:create]
  end
  resources :categories

  devise_for :users
  root to: "homes#index"

  resources :user_profiles, only: [:show] 
  post '/shipping_address', to: "user_profiles#shipping_address", only: [:create]
  resources :homes
  resources :carts 

  resources :wishlists
  resources :orders 
  resources :checkouts
  post '/confirm_payment', to: "checkouts#confirm_payment", as: :confirm_payment_checkout
end