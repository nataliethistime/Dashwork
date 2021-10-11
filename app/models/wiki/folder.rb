# == Schema Information
#
# Table name: wiki_folders
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#  tenant_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_wiki_folders_on_tenant_id  (tenant_id)
#  index_wiki_folders_on_user_id    (user_id)
#
module Wiki
  class Folder < ApplicationRecord
    belongs_to :tenant
    belongs_to :user
    belongs_to :parent, class_name: 'Wiki::Folder', optional: true
    has_many :folders, class_name: 'Wiki::Folder', foreign_key: 'parent_id', inverse_of: :parent, dependent: :restrict_with_error
    has_many :pages, dependent: :restrict_with_error

    validates :name, presence: true

    default_scope -> { order(:name) }
    scope :root_level, -> { where(parent_id: nil) }
    scope :children_of, ->(parent) { where(parent: parent) }

    decorate_with WikiFolderDecorator
  end
end
