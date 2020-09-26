# == Schema Information
#
# Table name: calendar_event_companies
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  calendar_event_id :bigint
#  company_id        :bigint
#
# Indexes
#
#  index_calendar_event_companies_on_calendar_event_id  (calendar_event_id)
#  index_calendar_event_companies_on_company_id         (company_id)
#
class CalendarEventCompany < ApplicationRecord
  belongs_to :calendar_event
  belongs_to :company
end
