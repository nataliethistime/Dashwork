# == Schema Information
#
# Table name: calendar_event_contacts
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  calendar_event_id :bigint
#  contact_id        :bigint
#
# Indexes
#
#  index_calendar_event_contacts_on_calendar_event_id  (calendar_event_id)
#  index_calendar_event_contacts_on_contact_id         (contact_id)
#
require 'test_helper'

class CalendarEventContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
