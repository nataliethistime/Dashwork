Rails.application.routes.draw do
  root to: 'application#home'

  #
  # Administration
  #
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'

  #
  # Authentication
  #
  devise_for :users

  #
  # Calendar
  #
  resources :calendar_events

  #
  # Companies
  #
  resources :companies
  resources :company_fields, controller: 'fields', defaults: { domain: 'company' }
  resources :company_groups, controller: 'groups', defaults: { domain: 'company' }
  get '/companies/:id/notes' => 'companies#show_notes', as: :company_notes
  get '/companies/:id/contacts' => 'companies#show_contacts', as: :company_contacts
  get '/companies/:id/tasks' => 'companies#show_tasks', as: :company_tasks
  get '/companies/:id/projects' => 'companies#show_projects', as: :company_projects

  #
  # Contacts
  #
  resources :contacts
  resources :contact_fields, controller: 'fields', defaults: { domain: 'contact' }
  resources :contact_groups, controller: 'groups', defaults: { domain: 'contact' }
  get '/contacts/:id/notes' => 'contacts#show_notes', as: :contact_notes
  get '/contacts/:id/tasks' => 'contacts#show_tasks', as: :contact_tasks
  get '/contacts/:id/projects' => 'contacts#show_projects', as: :contact_projects

  #
  # Equipment
  #
  resources :equipment

  #
  # Stars
  #
  get '/stars/:type/index' => 'stars#index', as: :stars
  get '/stars/:type/:id/toggle' => 'stars#toggle', as: :toggle_star

  #
  # Forms
  #
  resources :form_templates
  resources :forms

  #
  # Notes
  #
  resources :notes
  resources :note_groups, controller: 'groups', defaults: { domain: 'note', display_as: 'tag' }

  #
  # Projects
  #
  resources :projects

  #
  # Settings
  #
  namespace :settings do
    resources :profile, only: [:edit, :update]
    resources :tenant, only: [:new, :create, :edit, :update] do
      get '/apps' => 'tenant#edit_apps'
    end
  end

  #
  # Tasks
  #
  resources :tasks
end
