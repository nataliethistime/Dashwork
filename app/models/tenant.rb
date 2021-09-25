# == Schema Information
#
# Table name: tenants
#
#  id                 :bigint           not null, primary key
#  assets_app         :boolean          default(FALSE)
#  calendar_app       :boolean
#  companies_app      :boolean
#  contacts_app       :boolean
#  equipment_app      :boolean
#  form_templates_app :boolean
#  forms_app          :boolean
#  name               :string
#  notes_app          :boolean
#  personal_log_app   :boolean          default(FALSE)
#  projects_app       :boolean
#  reviews_app        :boolean          default(FALSE)
#  tasks_app          :boolean
#  timesheets_app     :boolean
#  wiki_app           :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Tenant < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :companies, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :wiki_folders, dependent: :destroy, class_name: 'Wiki::Folder'
  has_many :wiki_pages, dependent: :destroy, class_name: 'Wiki::Page'

  has_many :company_tags, dependent: :destroy
  has_many :contact_tags, dependent: :destroy
  has_many :note_tags, dependent: :destroy
  has_many :project_tags, dependent: :destroy
  has_many :task_tags, dependent: :destroy

  has_many :custom_fields, dependent: :destroy
  has_many :custom_company_fields, dependent: :destroy
  has_many :custom_contact_fields, dependent: :destroy
  has_many :custom_project_fields, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
end
