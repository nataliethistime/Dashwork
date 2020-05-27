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
require 'test_helper'

class CalendarEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
