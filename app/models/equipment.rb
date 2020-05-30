# == Schema Information
#
# Table name: equipment
#
#  id           :bigint           not null, primary key
#  name         :string
#  description  :text
#  model        :string
#  manufacturer :string
#  user_id      :integer
#  tenant_id    :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Equipment < ApplicationRecord
  belongs_to :tenant
  belongs_to :user, optional: true
  has_many :tasks, -> (equipment) { where(tenant_id: equipment.tenant_id) }
  has_many :notes, -> (equipment) { where(tenant_id: equipment.tenant_id) }
  has_many :forms, -> (equipment) { where(tenant_id: equipment.tenant_id) }
  # TODO: link projects
  # TODO: link calendar events
  # TODO: link tasks
  default_scope -> { order(:name) }
end
