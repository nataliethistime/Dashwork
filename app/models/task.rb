# == Schema Information
#
# Table name: tasks
#
#  id                :integer          not null, primary key
#  completed         :boolean
#  description       :text
#  due_date          :date
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  calendar_event_id :integer
#  company_id        :integer
#  contact_id        :integer
#  equipment_id      :integer
#  note_id           :integer
#  project_id        :integer
#  tenant_id         :integer
#  user_id           :integer
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

  after_initialize do |task|
    task.due_date ||= Time.zone.today if task.new_record?
  end

  default_scope -> { order(:due_date) }
  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: [false, nil]) }
  scope :scheduled, -> { where.not(due_date: nil) }
  scope :unscheduled, -> { where(due_date: nil) }
  scope :due_before, -> (date) { uncompleted.where('due_date IS NULL OR due_date < ?', date).reorder(due_date: :asc) }
  scope :newly_created, -> { uncompleted.reorder(created_at: :desc) }

  def has_links?
    calendar_event_id.present? ||
    company_id.present? ||
    contact_id.present? ||
    project_id.present? ||
    note_id.present?
  end
end
