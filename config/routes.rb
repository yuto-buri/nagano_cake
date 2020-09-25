Rails.application.routes.draw do
  namespace :admins do
    get 'homes/top'
  end

  resource :customers, only: [:show, :edit, :update] do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:new, :index, :create, :show]
  end

  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    passwords: 'customers/passwords',
    sessions: 'customers/sessions'}

  root 'homes#top'
  get 'homes/about'

  namespace :admins do
    get 'searches/search'
    resources :items, only:[:index,:create, :new, :edit, :show, :update]
    resources :orders, only:[:index, :create, :show, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :edit, :show, :update]
    resources :order_details, only:[:index, :create, :show, :update]
  end

  resources :items, only: [:index, :show]
  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw'

  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
        delete 'destroy_all'
    end
  end
  
  post 'orders/confirm' => 'orders#confirm', as: 'order_confirm'
  get 'orders/complete' => 'orders#complete', as: 'order_complete'

  get 'order_details/index'

  resources :genres, only: [:index, :show] do
    resources :items, only: [:index, :show]
  end

  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    passwords: 'admins/passwords',
    sessions: 'admins/sessions'}

  get '/search', to: 'search#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
