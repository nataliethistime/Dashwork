# == Schema Information
#
# Table name: tags
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
#  index_tags_on_tenant_id  (tenant_id)
#
class Tag < ApplicationRecord
  TYPES = %w{CompanyTag ContactTag NoteTag}

  belongs_to :tenant
  has_many :tag_assignments
  has_many :contacts, through: :tag_assignments, source: :taggable, source_type: 'Contact'
  has_many :companies, through: :tag_assignments, source: :taggable, source_type: 'Company'
  has_many :notes, through: :tag_assignments, source: :taggable, source_type: 'Note'

  validates :name, presence: true
  validates :type, presence: true, inclusion: { in: TYPES }

  decorate_with TagDecorator
end
