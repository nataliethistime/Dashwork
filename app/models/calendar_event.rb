# == Schema Information
#
# Table name: calendar_events
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  start_at    :datetime
#  end_at      :datetime
#  user_id     :integer          not null
#  tenant_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CalendarEvent < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  has_many :notes
  has_many :tasks
  has_many :forms

  has_many :calendar_event_companies, dependent: :destroy
  has_many :companies, through: :calendar_event_companies

  has_many :calendar_event_contacts, dependent: :destroy
  has_many :contacts, through: :calendar_event_contacts

  has_many :calendar_event_projects, dependent: :destroy
  has_many :projects, through: :calendar_event_projects

  default_scope -> { order(:start_at, :end_at) }
  decorate_with CalendarEventDecorator
end
