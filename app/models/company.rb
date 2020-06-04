# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  address     :string
#  description :text
#  email       :string
#  name        :string
#  phone       :string
#  website     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tenant_id   :integer          not null
#  user_id     :integer          not null
#
class Company < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  has_many :contacts, -> (company) { where(tenant_id: company.tenant_id) }
  has_many :forms, -> (company) { where(tenant_id: company.tenant_id) }
  has_many :notes, -> (company) { where(tenant_id: company.tenant_id) }
  has_many :tasks, -> (company) { where(tenant_id: company.tenant_id) }
  has_many :project_companies
  has_many :projects, -> (company) { where(tenant_id: company.tenant_id) }, through: :project_companies
  has_many :company_company_groups
  has_many :groups, -> (company) { where(tenant_id: company.tenant_id) }, through: :company_company_groups, source: :company_group
  # TODO: link events
  default_scope -> { order(:name) }
  decorate_with CompanyDecorator
end
