# == Schema Information
#
# Table name: values
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
#  custom_fieldable_id   :bigint
#  field_id              :bigint
#
# Indexes
#
#  index_values_on_field_id  (field_id)
#
require 'test_helper'

class ValueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
