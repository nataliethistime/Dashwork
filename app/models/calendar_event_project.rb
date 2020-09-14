# == Schema Information
#
# Table name: calendar_event_projects
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  calendar_event_id :bigint
#  project_id        :bigint
#
# Indexes
#
#  index_calendar_event_projects_on_calendar_event_id  (calendar_event_id)
#  index_calendar_event_projects_on_project_id         (project_id)
#
class CalendarEventProject < ApplicationRecord
  belongs_to :calendar_event
  belongs_to :project
end
