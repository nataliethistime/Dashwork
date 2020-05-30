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
  has_many :notes, -> (calendar_event) { where(tenant_id: calendar_event.tenant_id) }
  has_many :tasks, -> (calendar_event) { where(tenant_id: calendar_event.tenant_id) }
  has_many :forms, -> (calendar_event) { where(tenant_id: calendar_event.tenant_id) }
  # TODO: link companies
  # TODO: link contacts
  # TODO: link projects
  default_scope -> { order(:start_at, :end_at) }
end
