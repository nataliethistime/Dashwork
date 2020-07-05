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
  resources :company_tags, controller: 'tags', defaults: { type: 'company' }
  get '/companies/:id/contacts' => 'links#contacts', as: :company_contacts, defaults: { type: 'company' }
  get '/companies/:id/notes' => 'links#notes', as: :company_notes, defaults: { type: 'company' }
  get '/companies/:id/projects' => 'links#projects', as: :company_projects, defaults: { type: 'company' }
  get '/companies/:id/tasks' => 'links#tasks', as: :company_tasks, defaults: { type: 'company' }

  #
  # Contacts
  #
  resources :contacts
  resources :contact_fields, controller: 'fields', defaults: { domain: 'contact' }
  resources :contact_tags, controller: 'tags', defaults: { type: 'contact' }
  get '/contacts/:id/notes' => 'links#notes', as: :contact_notes, defaults: { type: 'contact' }
  get '/contacts/:id/projects' => 'links#projects', as: :contact_projects, defaults: { type: 'contact' }
  get '/contacts/:id/tasks' => 'links#tasks', as: :contact_tasks, defaults: { type: 'contact' }

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
  resources :note_tags, controller: 'tags', defaults: { type: 'note' }

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
