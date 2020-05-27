# == Schema Information
#
# Table name: equipment
#
#  id           :bigint           not null, primary key
#  name         :string
#  description  :text
#  model        :string
#  manufacturer :string
#  user_id      :integer
#  tenant_id    :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class EquipmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
