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
  has_many :forms, -> (form_template) { where(tenant_id: form_template.tenant_id) }
  default_scope -> { order(:name) }
end
