# == Schema Information
#
# Table name: wiki_pages
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  folder_id  :bigint
#  tenant_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_wiki_pages_on_folder_id  (folder_id)
#  index_wiki_pages_on_tenant_id  (tenant_id)
#  index_wiki_pages_on_user_id    (user_id)
#
module Wiki
  class Page < ApplicationRecord
    belongs_to :tenant
    belongs_to :user
    belongs_to :folder, optional: true
    has_many :notes, foreign_key: 'wiki_page_id'

    has_many :page_contacts
    has_many :contacts, through: :page_contacts

    has_many :page_companies
    has_many :companies, through: :page_companies

    has_many :page_projects
    has_many :projects, through: :page_projects

    validates :title, presence: true
    validates :content, presence: true

    scope :root_level, -> { where(folder: nil) }

    decorate_with WikiPageDecorator

    def has_links?
      contacts.any? || companies.any? || projects.any? || notes.any?
    end
  end
end
