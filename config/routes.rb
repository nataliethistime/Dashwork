Rails.application.routes.draw do
  devise_for :users
  resources :tenants, except: :destroy
  resources :notes
  root to: 'application#home'
end
