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
class Group < ApplicationRecord
  TYPES = %w{CompanyGroup ContactGroup}

  belongs_to :tenant

  validates :name, presence: true
  validates :type, presence: true, inclusion: { in: TYPES }

  decorate_with GroupDecorator
end