Rails.application.routes.draw do
  get 'orders/:item_id/complete', to: 'orders#complete'
  get 'orders/:item_id/cancel', to: 'orders#cancel'
  get 'orders/:item_id', to: 'orders#new', as: 'new_order'
  get 'locations/new', to: 'locations#new', as: 'new_location'
  post 'locations/new', to: 'locations#create'
  post 'buckets/:bucket_id/items/:item_id/edit', to: 'items#update'
  resources :locations, only: [:show, :edit, :create, :update]
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'buckets/user', to: 'buckets#user', as: 'user_buckets'

  resources :buckets do 
    get 'destroy', to: 'buckets#destroy', as: 'destroy' 
    post 'items/new', to: 'items#create'
    get 'items/:id/destroy', to: 'items#destroy', as: 'item_destroy'
    resources :items do
      
    end
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  devise_for :users
  get 'users/:id', to: 'users#show', as: 'user_profile'
end
