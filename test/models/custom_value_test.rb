# == Schema Information
#
# Table name: custom_values
#
#  id                    :bigint           not null, primary key
#  boolean_entity        :boolean
#  custom_fieldable_type :string
#  date_entity           :date
#  datetime_entity       :datetime
#  float_entity          :float
#  integer_entity        :integer
#  string_entity         :string
#  text_entity           :text
#  time_entity           :time
#  type                  :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  custom_field_id       :bigint
#  custom_fieldable_id   :bigint
#
# Indexes
#
#  index_custom_values_on_custom_field_id  (custom_field_id)
#
require 'test_helper'

class ValueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
