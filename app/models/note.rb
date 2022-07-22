# == Schema Information
#
# Table name: notes
#
#  id                :integer          not null, primary key
#  content           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  calendar_event_id :integer
#  company_id        :integer
#  contact_id        :integer
#  equipment_id      :integer
#  project_id        :integer
#  task_id           :integer
#  tenant_id         :integer          not null
#  user_id           :integer          not null
#  wiki_page_id      :integer
#
# Indexes
#
#  index_notes_on_wiki_page_id  (wiki_page_id)
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
  belongs_to :wiki_page, class_name: 'Wiki::Page', optional: true

  validates :content, presence: true

  default_scope -> { order(updated_at: :desc) }
  decorate_with NoteDecorator

  include Taggable

  def has_links?
    calendar_event_id.present? ||
    company_id.present? ||
    contact_id.present? ||
    equipment_id.present? ||
    project_id.present? ||
    task_id.present?
  end
end
