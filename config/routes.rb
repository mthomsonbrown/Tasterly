Rails.application.routes.draw do
  root 'index#home'
  get 'home' => 'index#home'
  
  devise_for :users
  get 'dashboard' => 'users#dashboard'
  
  resources :beers
  resources :flavors
end
