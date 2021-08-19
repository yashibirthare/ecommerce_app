Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products do
    resources :cart_items, only: [:create]
  end
  resources :categories

  devise_for :users
  root to: "homes#index"

  resources :user_profiles, only: [:show] 

  resources :homes
  resources :carts 

  resources :wishlists
  resources :orders
end
