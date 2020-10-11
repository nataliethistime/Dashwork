# == Schema Information
#
# Table name: wiki_pages
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  folder_id  :bigint
#  tenant_id  :bigint
#
# Indexes
#
#  index_wiki_pages_on_folder_id  (folder_id)
#  index_wiki_pages_on_tenant_id  (tenant_id)
#
module Wiki
  class Page < ApplicationRecord
    belongs_to :tenant
    belongs_to :folder, optional: true

    validates :title, presence: true
    validates :content, presence: true

    scope :root_level, -> { where(folder: nil) }

    decorate_with WikiPageDecorator
  end
end
