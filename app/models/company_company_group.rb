# == Schema Information
#
# Table name: company_company_groups
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  company_group_id :bigint
#  company_id       :bigint
#
# Indexes
#
#  index_company_company_groups_on_company_group_id  (company_group_id)
#  index_company_company_groups_on_company_id        (company_id)
#
class CompanyCompanyGroup < ApplicationRecord
  belongs_to :company
  belongs_to :company_group
end