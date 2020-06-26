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
class ContactGroup < Group
  has_many :contact_contact_groups
  has_many :contacts, through: :contact_contact_groups
end
