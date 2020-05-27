Rails.application.routes.draw do
  resources :projects
  devise_for :users
  resources :tenants, except: :destroy
  resources :notes
  resources :tasks
  root to: 'application#home'
end
