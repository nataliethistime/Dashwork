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
  TYPES = %w{CompanyTag ContactTag NoteTag ProjectTag}

  belongs_to :tenant
  has_many :tag_assignments, dependent: :restrict_with_error
  has_many :contacts, through: :tag_assignments, source: :taggable, source_type: 'Contact'
  has_many :companies, through: :tag_assignments, source: :taggable, source_type: 'Company'
  has_many :notes, through: :tag_assignments, source: :taggable, source_type: 'Note'
  has_many :projects, through: :tag_assignments, source: :taggable, source_type: 'Project'

  validates :name, presence: true
  validates :type, presence: true, inclusion: { in: TYPES }

  decorate_with TagDecorator
end
