Rails.application.routes.draw do
  
  get 'items/index'
  get 'items/show'
  get 'items/new'
  get 'items/edit'
  root 'pages#index'
  get 'about', to: 'pages#about'
  get 'buckets/user', to: 'buckets#user', as: 'user_buckets'

  resources :buckets do 
    get 'destroy', to: 'buckets#destroy', as: 'destroy' 
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
