# == Schema Information
#
# Table name: fields
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
#  index_fields_on_tenant_id  (tenant_id)
#
class Field < ApplicationRecord
  self.inheritance_column = :domain
  decorate_with FieldDecorator

  TYPES = %w{StringValue TextValue}
  DOMAINS = %w{CompanyField ContactField ProjectField}

  belongs_to :tenant
  has_many :values

  validates :name, presence: true
  validates :domain, presence: true, inclusion: { in: DOMAINS }
  validates :type, presence: true, inclusion: { in: TYPES }
end
