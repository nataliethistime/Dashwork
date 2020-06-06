# == Schema Information
#
# Table name: tenants
#
#  id                 :bigint           not null, primary key
#  calendar_app       :boolean
#  companies_app      :boolean
#  contacts_app       :boolean
#  equipment_app      :boolean
#  form_templates_app :boolean
#  forms_app          :boolean
#  name               :string
#  notes_app          :boolean
#  projects_app       :boolean
#  tasks_app          :boolean
#  timesheets_app     :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Tenant < ApplicationRecord
  has_many :calendar_events
  has_many :users
  has_many :notes
  has_many :tasks
  has_many :companies
  has_many :contacts
  has_many :equipment
  has_many :forms
  has_many :form_templates
  has_many :projects

  validates :name, presence: true, length: { minimum: 3 }

  APPS = {
    calendar: { name: 'Calendar', id: 'calendar', path: Rails.application.routes.url_helpers.calendar_events_path },
    companies: { name: 'Companies', id: 'companies', path: Rails.application.routes.url_helpers.companies_path },
    contacts: { name: 'Contacts', id: 'contacts', path: Rails.application.routes.url_helpers.contacts_path },
    equipment: { name: 'Equipment', id: 'equipment', path: Rails.application.routes.url_helpers.equipment_index_path },
    form_templates: { name: 'Form Templates', id: 'form_templates', path: Rails.application.routes.url_helpers.form_templates_path },
    forms: { name: 'Forms', id: 'forms', path: Rails.application.routes.url_helpers.forms_path },
    notes: { name: 'Notes', id: 'notes', path: Rails.application.routes.url_helpers.notes_path },
    projects: { name: 'Projects', id: 'projects', path: Rails.application.routes.url_helpers.projects_path },
    tasks: { name: 'Tasks', id: 'tasks', path: Rails.application.routes.url_helpers.tasks_path }
  }

  def self.all_apps
    APPS.keys
  end

  def has_app?(id)
    self["#{id}_app"]
  end

  def apps
    APPS.values.select { |app| has_app? app[:id] }
  end
end
