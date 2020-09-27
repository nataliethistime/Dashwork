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
class FormTemplateField < ApplicationRecord
  self.inheritance_column = nil
  self.table_name = 'form_fields'

  belongs_to :form_template

  TYPES = %w{FormStringValue}.freeze

  validates :label, presence: true
  validates :type, presence: true, inclusion: { in: TYPES }

  decorate_with FormTemplateFieldDecorator
end
