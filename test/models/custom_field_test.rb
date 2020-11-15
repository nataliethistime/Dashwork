# == Schema Information
#
# Table name: custom_fields
#
#  id         :bigint           not null, primary key
#  domain     :string
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tenant_id  :bigint
#
# Indexes
#
#  index_custom_fields_on_tenant_id  (tenant_id)
#
require 'test_helper'

class FieldTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end