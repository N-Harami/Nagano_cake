Rails.application.routes.draw do

  root "public/homes#top"
  get '/about' => 'public/homes#about'
  get '/admin' => 'admin/homes#top'

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  namespace :public do
    resources :items, only: [:index, :show]
    get 'customers/check'
    get 'customers/mypage', to: 'customers#show', as: 'mypage'
    get 'customers/information/edit', to: 'customers#edit', as: 'edit_information'
    patch 'customers/information', to: 'customers#update'
    patch 'customers/withdraw', to: 'customers#withdraw'
    resources :cart_items, only: [:create, :index, :update, :destroy] do
      collection do
        delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post '/orders/confirm' => 'orders#confirm', as: 'confirm'
        get '/orders/complete' => 'orders#complete', as: 'complete'
      end
    end
    resources :addresses, only: [:create, :index, :edit, :update, :destroy]
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 end