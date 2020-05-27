Rails.application.routes.draw do
  resources :companies
  resources :projects
  devise_for :users
  resources :tenants, except: :destroy
  resources :notes
  resources :tasks
  root to: 'application#home'
end
