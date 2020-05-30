# == Schema Information
#
# Table name: tasks
#
#  id                :bigint           not null, primary key
#  name              :string
#  description       :text
#  due_date          :date
#  completed         :boolean
#  user_id           :integer
#  tenant_id         :integer
#  contact_id        :integer
#  equipment_id      :integer
#  project_id        :integer
#  calendar_event_id :integer
#  note_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :integer
#
class Task < ApplicationRecord
  belongs_to :user
  belongs_to :tenant
  belongs_to :contact, -> (task) { where(tenant_id: task.tenant_id) }, optional: true
  belongs_to :companies, -> (task) { where(tenant_id: task.tenant_id) }, optional: true
  belongs_to :project, -> (task) { where(tenant_id: task.tenant_id) }, optional: true
  belongs_to :equipment, -> (task) { where(tenant_id: task.tenant_id) }, optional: true
  belongs_to :calendar_event, -> (task) { where(tenant_id: task.tenant_id) }, optional: true
  validates :name, presence: true
  validates :description, presence: true, allow_blank: true
  default_scope -> { order(:completed, :due_date) }
  decorate_with TaskDecorator
end
