Rails.application.routes.draw do


  resources :histories
  resources :roles
  resources :brands
  resources :units
  resources :inventories
  resources :categories
  resources :funds
  resources :projects
  resources :users


  get 'pages/dashboard'
  resources :suppliers
  resources :stocks
  devise_for :users
  get 'about', to: 'home#about'
  root 'home#index'
  
  # Error Handler
  get '*unmatched_route', to: 'errors#not_found'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
