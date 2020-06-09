# == Schema Information
#
# Table name: notes
#
#  id                :bigint           not null, primary key
#  title             :string
#  content           :text
#  user_id           :integer          not null
#  tenant_id         :integer          not null
#  contact_id        :integer
#  task_id           :integer
#  equipment_id      :integer
#  project_id        :integer
#  calendar_event_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :integer
#
class Note < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  belongs_to :contact, optional: true
  belongs_to :company, optional: true
  belongs_to :equipment, optional: true
  belongs_to :project, optional: true
  belongs_to :task, optional: true
  belongs_to :calendar_event, optional: true
  validates :title, presence: true
  validates :content, presence: true, allow_blank: true
  default_scope -> { order(updated_at: :desc) }
  decorate_with NoteDecorator
end
