Rails.application.routes.draw do
  get 'home/index'

  # root 'index#home'
  root 'home#index'
  get 'home' => 'home#index'
  
  devise_for :users
  get 'dashboard' => 'users#index'
  
  resources :beers
  resources :flavors
  
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
    end
  end
end
