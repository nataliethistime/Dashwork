# == Schema Information
#
# Table name: notes
#
#  id                :bigint           not null, primary key
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
#
require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
