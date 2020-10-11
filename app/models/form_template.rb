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
class FormTemplate < ApplicationRecord
  belongs_to :tenant
  has_many :forms, dependent: :restrict_with_error
  has_many :fields, class_name: 'FormTemplateField', dependent: :destroy
  default_scope -> { order(:name) }
  decorate_with FormTemplateDecorator
end
