Rails.application.routes.draw do
  devise_for :users
  get 'dashboard' => 'users#dashboard'
  get 'home' => 'index#home'
  root 'index#home'

end
