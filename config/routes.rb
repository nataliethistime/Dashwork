Rails.application.routes.draw do
  resources :contacts
  resources :form_templates
  resources :forms
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
