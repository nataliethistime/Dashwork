# == Schema Information
#
# Table name: tasks
#
#  id                :integer          not null, primary key
#  completed         :boolean
#  description       :text
#  due_date          :date
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  calendar_event_id :integer
#  company_id        :integer
#  contact_id        :integer
#  equipment_id      :integer
#  note_id           :integer
#  project_id        :integer
#  tenant_id         :integer
#  user_id           :integer
#
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
