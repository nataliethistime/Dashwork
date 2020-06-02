Rails.application.routes.draw do
  resources :contacts
  resources :form_templates
  resources :forms
  resources :calendar_events
  resources :equipment
  resources :companies
  resources :projects
  devise_for :users
  resources :notes
  resources :tasks
  namespace :settings do
    resources :profile, only: [:edit, :update]
    resources :tenant, only: [:new, :create, :edit, :update] do
      get '/apps' => 'tenant#edit_apps'
    end
  end
  root to: 'application#home'
end
