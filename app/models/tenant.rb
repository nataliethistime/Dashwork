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
  has_many :note_groups
  has_many :tasks
  has_many :companies
  has_many :company_groups
  has_many :contacts
  has_many :contact_groups
  has_many :equipment
  has_many :forms
  has_many :form_templates
  has_many :projects

  has_many :fields
  has_many :company_fields
  has_many :contact_fields

  validates :name, presence: true, length: { minimum: 3 }

  APPS = {
    calendar: { name: 'Calendar', id: 'calendar', path: routes.calendar_events_path },
    companies: { name: 'Companies', id: 'companies', path: routes.companies_path },
    contacts: { name: 'Contacts', id: 'contacts', path: routes.contacts_path },
    equipment: { name: 'Equipment', id: 'equipment', path: routes.equipment_index_path },
    form_templates: { name: 'Form Templates', id: 'form_templates', path: routes.form_templates_path },
    forms: { name: 'Forms', id: 'forms', path: routes.forms_path },
    notes: { name: 'Notes', id: 'notes', path: routes.notes_path },
    projects: { name: 'Projects', id: 'projects', path: routes.projects_path },
    tasks: { name: 'Tasks', id: 'tasks', path: routes.tasks_path }
  }.freeze

  def self.all_apps
    APPS.keys
  end

  def has_app?(id)
    self["#{id}_app"]
  end

  def apps
    APPS.values.select { |app| has_app? app[:id] }
  end

  def fields_for(domain)
    case domain
    when 'company'
      company_fields
    end
  end
end
