Rails.application.routes.draw do
  
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

  devise_for :users

end
