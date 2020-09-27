# == Schema Information
#
# Table name: form_fields
#
#  id               :bigint           not null, primary key
#  label            :string           not null
#  type             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  form_template_id :bigint
#
# Indexes
#
#  index_form_fields_on_form_template_id  (form_template_id)
#
require 'test_helper'

class FormFieldTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
