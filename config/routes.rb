Rails.application.routes.draw do

  root "public/homes#top"
  namespace :public do
  get 'homes/about' => 'homes#about' ,as: "about"
end

  namespace :public do
  resources :items ,only: [:index, :show]
end

  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/confirm'
    get 'orders/complete'
  end
  namespace :public do


    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    delete 'cart_items/:id' => 'cart_items#destroy'

    resources :cart_items, only: [:destroy]


    get 'cart_items' => 'cart_items#index'
    post 'cart_items' => 'cart_items#create'
    patch 'cart_items/:id' => 'cart_items#update'
  end

  namespace :public do
    resources :customers, only: [:update]
  get 'customers/:id' => 'customers#show' ,as: '/customers/mypage'
  get 'customers/:id/edit' => 'customers#edit' , as: '/customers/information/edit'
  get "/customers/check" => "customers#check"
  patch "/customers/withdraw" => "customers#withdraw"

  end

  namespace :public do
  resources :addresses, only: [:index, :edit, :destroy]
  # get 'addresses' => 'addresses#index'
  # get 'addresses/edit'
  post 'addresses' => 'addresses#create'
  # get 'address/:id/edit' => 'addresses#edit', as: 'edit_address'
  patch 'addresses/:id' => 'addresses#update', as: 'update_address'
  end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

 end