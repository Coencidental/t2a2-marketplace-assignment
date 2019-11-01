Rails.application.routes.draw do
  

  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'buckets/user', to: 'buckets#user', as: 'user_buckets'

  resources :buckets do 
    get 'destroy', to: 'buckets#destroy', as: 'destroy' 
    post 'items/new', to: 'items#create'
    resources :items
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
