Rails.application.routes.draw do
  resources :contacts
  resources :form_templates
  resources :forms
  resources :calendar_events
  resources :equipment
  resources :companies
  resources :company_groups
  get '/companies/:id/notes' => 'companies#show_notes', as: :company_notes
  get '/companies/:id/contacts' => 'companies#show_contacts', as: :company_contacts
  get '/companies/:id/tasks' => 'companies#show_tasks', as: :company_tasks
  get '/companies/:id/projects' => 'companies#show_projects', as: :company_projects
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
