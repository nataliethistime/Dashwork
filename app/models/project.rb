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
  has_many :notes, -> (project) { where(tenant_id: project.tenant_id) }
  has_many :tasks, -> (project) { where(tenant_id: project.tenant_id) }
  has_many :forms, -> (project) { where(tenant_id: project.tenant_id) }
  has_many :project_companies
  has_many :companies, -> (project) { where(tenant_id: project.tenant_id) }, through: :project_companies
  # TODO: link contacts
  # TODO: link calendar events
  # TODO: link equipment
  default_scope -> { order(:name) }
  decorate_with ProjectDecorator
end
