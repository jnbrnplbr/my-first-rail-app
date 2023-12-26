Rails.application.routes.draw do


  get 'pages/dashboard'
  resources :suppliers
  resources :stocks
  devise_for :users
  get 'about', to: 'home#about'
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
