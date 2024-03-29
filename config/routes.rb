Rails.application.routes.draw do
  root to: 'dashboard#home'

  #
  # Administration
  #
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  #
  # Authentication
  #
  devise_for :users, controllers: { registrations: 'users/registrations' }

  #
  # Companies
  #
  resources :companies
  resources :custom_company_fields, controller: 'custom_fields', defaults: { domain: 'company' }
  resources :company_tags, controller: 'tags', defaults: { type: 'company' }
  get '/companies/:id/contacts' => 'links#contacts', as: :company_contacts, defaults: { type: 'company' }
  get '/companies/:id/notes' => 'links#notes', as: :company_notes, defaults: { type: 'company' }
  get '/companies/:id/projects' => 'links#projects', as: :company_projects, defaults: { type: 'company' }
  get '/companies/:id/tasks' => 'links#tasks', as: :company_tasks, defaults: { type: 'company' }

  #
  # Contacts
  #
  resources :contacts
  resources :custom_contact_fields, controller: 'custom_fields', defaults: { domain: 'contact' }
  resources :contact_tags, controller: 'tags', defaults: { type: 'contact' }
  get '/contacts/:id/notes' => 'links#notes', as: :contact_notes, defaults: { type: 'contact' }
  get '/contacts/:id/projects' => 'links#projects', as: :contact_projects, defaults: { type: 'contact' }
  get '/contacts/:id/tasks' => 'links#tasks', as: :contact_tasks, defaults: { type: 'contact' }

  #
  # Dashboard
  #
  namespace :dashboard do
    get :home
  end

  #
  # Notes
  #
  resources :notes
  resources :note_tags, controller: 'tags', defaults: { type: 'note' }

  #
  # Personal Log
  #
  namespace :personal_log do
    resources :entries
    get 'review' => 'entries#review'
    get 'export' => 'entries#export'
    get 'timeline' => 'entries#timeline'
  end

  #
  # Projects
  #
  resources :projects do
    get 'closed', on: :collection
  end
  resources :custom_project_fields, controller: 'custom_fields', defaults: { domain: 'project' }
  resources :project_tags, controller: 'tags', defaults: { type: 'project' }
  get '/projects/:id/tasks' => 'links#tasks', as: :project_tasks, defaults: { type: 'project' }

  #
  # Settings
  #
  namespace :settings do
    resources :appearance, only: [:index, :update]
    resources :profile, only: [:index, :update]
  end

  #
  # Stars
  #
  get '/stars/:type/index' => 'stars#index', as: :stars
  get '/stars/:type/:id/toggle' => 'stars#toggle', as: :toggle_star

  #
  # Tasks
  #
  resources :tasks do
    get :completed, on: :collection
  end
  resources :task_tags, controller: 'tags', defaults: { type: 'task' }

  #
  # Wiki
  #
  namespace :wiki do
    resources :folders
    resources :pages, except: :index
  end
end
