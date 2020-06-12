# == Schema Information
#
# Table name: string_values
#
#  id         :bigint           not null, primary key
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  field_id   :integer
#
require 'test_helper'

class StringValueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
