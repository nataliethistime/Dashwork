# == Schema Information
#
# Table name: form_templates
#
#  id         :bigint           not null, primary key
#  name       :string
#  tenant_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class FormTemplateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
