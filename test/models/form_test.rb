# == Schema Information
#
# Table name: forms
#
#  id                :bigint           not null, primary key
#  name              :string
#  status            :integer
#  user_id           :integer          not null
#  tenant_id         :integer          not null
#  form_template_id  :integer          not null
#  contact_id        :integer
#  equipment_id      :integer
#  project_id        :integer
#  calendar_event_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'test_helper'

class FormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
