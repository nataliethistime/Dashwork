# == Schema Information
#
# Table name: notes
#
#  id                :bigint           not null, primary key
#  title             :string
#  content           :text
#  user_id           :integer          not null
#  tenant_id         :integer          not null
#  contact_id        :integer
#  task_id           :integer
#  equipment_id      :integer
#  project_id        :integer
#  calendar_event_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :integer
#
require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
