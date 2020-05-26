class Tenant < ApplicationRecord
  has_many :users
  has_many :notes

  validates :name, presence: true, length: { minimum: 3 }

  APPS = {
    notes: { name: 'Notes', path: Rails.application.routes.url_helpers.notes_path }
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
