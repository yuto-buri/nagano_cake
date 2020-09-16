Rails.application.routes.draw do
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    passwords: 'customers/passwords',
    sessions: 'customers/sessions'}

    resources :customers, only: [:edit, :show, :update]

  root 'home#top' 
  get 'home/about'

  namespace :admins do
    get 'searches/search'
  end
  namespace :admins do
    get 'items/edit'
    get 'items/index'
    get 'items/new'
    get 'items/show'
  end
  namespace :admins do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admins do
    get 'genres/edit'
    get 'genres/index'
  end
  namespace :admins do
    get 'customers/edit'
    get 'customers/index'
    get 'customers/show'
  end
  get 'items/index'
  get 'items/show'
  get 'orders/confirm'
  get 'orders/index'
  get 'orders/new'
  get 'orders/show'
  get 'orders/thanks'
  get 'order_details/index'
  get 'genres/index'
  get 'genres/show'
  get 'customers/edit'
  get 'customers/show'
  get 'customers/withdraw'
  get 'cart_items/index'
  get 'addresses/edit'
  get 'addresses/index'
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
