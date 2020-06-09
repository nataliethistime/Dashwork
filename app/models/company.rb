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
  has_many :contacts
  has_many :forms
  has_many :notes
  has_many :tasks
  has_many :project_companies
  has_many :projects, through: :project_companies
  has_many :company_company_groups
  has_many :groups, through: :company_company_groups, source: :company_group
  # TODO: link events
  default_scope -> { order(:name) }
  decorate_with CompanyDecorator
end
