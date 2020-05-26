Rails.application.routes.draw do
  devise_for :users
  resources :tenants, only: [:new, :create]
  root to: 'application#home'
end
