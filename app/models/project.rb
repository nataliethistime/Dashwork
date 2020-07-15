# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  start_date  :date
#  end_date    :date
#  user_id     :integer          not null
#  tenant_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Project < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  has_many :notes
  has_many :tasks
  has_many :forms
  has_many :project_companies
  has_many :companies, through: :project_companies
  has_many :project_contacts
  has_many :contacts, through: :project_contacts
  # TODO: link calendar events
  # TODO: link equipment
  decorate_with ProjectDecorator
  include Taggable
  include CustomFieldable
  include Starrable

  default_scope -> { order(:name) }
  scope :open, -> { all }
  scope :newly_created, -> { all.reorder(created_at: :desc) }
end
