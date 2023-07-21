Rails.application.routes.draw do
  namespace :public do
  root to: "homes#top"
  get 'homes/about' => 'homes#about' ,as: "about"
end

  namespace :public do
  resources :items, only: [:index, :show]
end

  namespace :public do
    get 'orders/new'
    get 'orders/index'
    get 'orders/show'
    get 'orders/confirm'
    get 'orders/complete'
  end
  namespace :public do
    resources :cart_items, only: [:destroy]
    
    get 'cart_items' => 'cart_items#index'
    post 'cart_items' => 'cart_items#create'
    patch 'cart_items/:id' => 'cart_items#update'
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
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
