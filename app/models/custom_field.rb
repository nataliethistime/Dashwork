# == Schema Information
#
# Table name: custom_fields
#
#  id         :bigint           not null, primary key
#  domain     :string
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tenant_id  :bigint
#
# Indexes
#
#  index_custom_fields_on_tenant_id  (tenant_id)
#
class CustomField < ApplicationRecord
  self.inheritance_column = :domain
  decorate_with FieldDecorator

  TYPES = %w{CustomStringValue CustomTextValue}.freeze
  DOMAINS = %w{CustomCompanyField CustomContactField CustomProjectField}.freeze

  belongs_to :tenant
  has_many :custom_values, dependent: :restrict_with_error

  validates :name, presence: true
  validates :domain, presence: true, inclusion: { in: DOMAINS }
  validates :type, presence: true, inclusion: { in: TYPES }
end
