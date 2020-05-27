# == Schema Information
#
# Table name: tasks
#
#  id                :bigint           not null, primary key
#  name              :string
#  description       :text
#  due_date          :date
#  completed         :boolean
#  user_id           :integer
#  tenant_id         :integer
#  contact_id        :integer
#  equipment_id      :integer
#  project_id        :integer
#  calendar_event_id :integer
#  note_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :integer
#
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
