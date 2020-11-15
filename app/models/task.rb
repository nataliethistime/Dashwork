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
  include Taggable

  belongs_to :user
  belongs_to :tenant
  belongs_to :contact, optional: true
  belongs_to :company, optional: true
  belongs_to :project, optional: true
  belongs_to :equipment, optional: true
  belongs_to :calendar_event, optional: true
  validates :name, presence: true
  validates :description, presence: true, allow_blank: true
  decorate_with TaskDecorator

  default_scope -> { order(:due_date) }
  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: [false, nil]) }
  scope :due_before, -> (date) { uncompleted.where('due_date IS NULL OR due_date < ?', date).reorder(due_date: :asc) }
  scope :newly_created, -> { uncompleted.reorder(created_at: :desc) }
end
