# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tenant_id  :bigint
#
# Indexes
#
#  index_groups_on_tenant_id  (tenant_id)
#
class CompanyGroup < Group
  has_many :company_company_groups
  has_many :companies, through: :company_company_groups
end
