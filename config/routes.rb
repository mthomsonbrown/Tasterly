Rails.application.routes.draw do
  get 'home/index'

  # root 'index#home'
  root 'home#index'
  get 'home' => 'home#index'
  
  devise_for :users
  get 'dashboard' => 'users#index'
  
  resources :beers
  resources :flavors
  
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :beers, except: [:new, :edit]
      resources :flavors, except: [:new, :edit]
      post 'sign_in' => 'users#sign_in'
    end
  end
end
