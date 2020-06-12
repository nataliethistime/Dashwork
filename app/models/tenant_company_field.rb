# == Schema Information
#
# Table name: company_fields
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#  field_id   :bigint
#  tenant_id  :bigint
#
# Indexes
#
#  index_company_fields_on_company_id  (company_id)
#  index_company_fields_on_field_id    (field_id)
#  index_company_fields_on_tenant_id   (tenant_id)
#
# Foreign Keys
#
#  fk_rails_...  (tenant_id => tenants.id)
#
class TenantCompanyField < ApplicationRecord
  self.table_name = 'company_fields'
  belongs_to :field
  belongs_to :tenant
  accepts_nested_attributes_for :field
end
