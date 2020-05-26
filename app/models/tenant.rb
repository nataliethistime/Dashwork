# == Schema Information
#
# Table name: tenants
#
#  id             :bigint           not null, primary key
#  name           :string
#  notes_app      :boolean
#  contacts_app   :boolean
#  forms_app      :boolean
#  tasks_app      :boolean
#  equipment_app  :boolean
#  projects_app   :boolean
#  calendar_app   :boolean
#  timesheets_app :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Tenant < ApplicationRecord
  has_many :users
  has_many :notes
  has_many :tasks

  validates :name, presence: true, length: { minimum: 3 }

  APPS = {
    notes: { name: 'Notes', path: Rails.application.routes.url_helpers.notes_path },
    tasks: { name: 'Tasks', path: Rails.application.routes.url_helpers.tasks_path }
  }

  def self.all_apps
    APPS.keys
  end

  def has_app?(id)
    self["#{id}_app"]
  end

  def apps
    apps = []
    Tenant.all_apps.each do |id|
      apps << APPS[id] if has_app? id
    end
    apps
  end
end
