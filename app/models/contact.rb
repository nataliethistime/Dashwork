# == Schema Information
#
# Table name: contacts
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  website     :string
#  email       :string
#  phone       :string
#  user_id     :integer          not null
#  tenant_id   :integer          not null
#  company_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Contact < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  belongs_to :company, -> (contact) { where(tenant_id: contact.tenant_id) }, optional: true
  has_many :notes, -> (contact) { where(tenant_id: contact.tenant_id) }
  has_many :forms, -> (contact) { where(tenant_id: contact.tenant_id) }
  has_many :notes, -> (contact) { where(tenant_id: contact.tenant_id) }
  has_many :tasks, -> (contact) { where(tenant_id: contact.tenant_id) }
  # TODO: link events
  # TODO: link projects
end
