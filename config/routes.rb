Rails.application.routes.draw do
  get "home/index"
  devise_for :users
  resources :ballistics, only: [:new, :create, :show]
  root to: 'ballistics#new'
end
