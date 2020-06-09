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
  # TODO: link companies
  # TODO: link contacts
  # TODO: link projects
  default_scope -> { order(:start_at, :end_at) }
end
