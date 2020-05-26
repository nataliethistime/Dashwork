# == Schema Information
#
# Table name: tenants
#
#  id             :bigint           not null, primary key
#  name           :string
#  notes_app      :boolean
#  contacts_app   :boolean
#  forms_app      :boolean
#  tasks_app      :boolean
#  equipment_app  :boolean
#  projects_app   :boolean
#  calendar_app   :boolean
#  timesheets_app :boolean
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class TenantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
