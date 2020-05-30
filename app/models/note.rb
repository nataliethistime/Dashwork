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
  belongs_to :contact, -> (note) { where(tenant_id: note.tenant_id) }, optional: true
  belongs_to :company, -> (note) { where(tenant_id: note.tenant_id) }, optional: true
  belongs_to :equipment, -> (note) { where(tenant_id: note.tenant_id) }, optional: true
  belongs_to :project, -> (note) { where(tenant_id: note.tenant_id) }, optional: true
  belongs_to :task, -> (note) { where(tenant_id: note.tenant_id) }, optional: true
  belongs_to :calendar_event, -> (note) { where(tenant_id: note.tenant_id) }, optional: true
  validates :title, presence: true
  validates :content, presence: true, allow_blank: true
  default_scope -> { order(updated_at: :desc) }
  include MiniDecorator.new(NoteDecorator.new)
end
