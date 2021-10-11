# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  country                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  first_name             :string
#  last_name              :string
#  locked_at              :datetime
#  preferred_theme        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  time_zone              :string
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  tenant_id              :integer
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#
class User < ApplicationRecord
  PREFERRED_THEMES = %w[light dark system]

  devise(
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :confirmable,
    :lockable
  )

  belongs_to :tenant, optional: true

  has_many :companies, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :personal_log_entries, class_name: 'PersonalLog::Entry', dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :wiki_folders, dependent: :destroy, class_name: 'Wiki::Folder'
  has_many :wiki_pages, dependent: :destroy, class_name: 'Wiki::Page'

  has_many :company_tags, dependent: :destroy
  has_many :contact_tags, dependent: :destroy
  has_many :note_tags, dependent: :destroy
  has_many :project_tags, dependent: :destroy
  has_many :task_tags, dependent: :destroy

  has_many :custom_company_fields, dependent: :destroy
  has_many :custom_contact_fields, dependent: :destroy
  has_many :custom_fields, dependent: :destroy
  has_many :custom_project_fields, dependent: :destroy

  has_many :stars, dependent: :destroy
  has_many :starred_companies, through: :stars, source: :starrable, source_type: 'Company', dependent: :destroy
  has_many :starred_contacts, through: :stars, source: :starrable, source_type: 'Contact', dependent: :destroy
  has_many :starred_projects, through: :stars, source: :starrable, source_type: 'Project', dependent: :destroy

  decorate_with UserDecorator

  validates :preferred_theme, inclusion: { in: PREFERRED_THEMES }

  def preferred_theme
    super.presence || 'system'
  end
end
