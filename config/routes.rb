Rails.application.routes.draw do
  resources :images
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#welcome'

  resources :products
  resources :categories
  resources :users
  resources :carts
  resources :pays
  resources :cartitems
  resources :orders
  put '/product/:id/wishlist',to:'products#wishlist',as:'wishlist'
  resources :wishlists
  resources :addresses
  get 'search', to: 'products#search'
end
