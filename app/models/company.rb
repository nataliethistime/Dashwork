# == Schema Information
#
# Table name: companies
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  website     :string
#  email       :string
#  phone       :string
#  user_id     :integer          not null
#  tenant_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Company < ApplicationRecord
  belongs_to :tenant
  belongs_to :user
  has_many :contacts, -> (company) { where(tenant_id: company.tenant_id) }
  has_many :forms, -> (company) { where(tenant_id: company.tenant_id) }
  has_many :notes, -> (company) { where(tenant_id: company.tenant_id) }
  has_many :tasks, -> (company) { where(tenant_id: company.tenant_id) }
  # TODO: link events
  # TODO: link projects
end
