Rails.application.routes.draw do
  resources :calendar_events
  resources :equipment
  resources :companies
  resources :projects
  devise_for :users
  resources :tenants, except: :destroy
  resources :notes
  resources :tasks
  root to: 'application#home'
end
