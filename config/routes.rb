Rails.application.routes.draw do
  devise_for :users
  get 'users/dashboard'
  get 'home' => 'index#home'
  root 'index#home'

end
