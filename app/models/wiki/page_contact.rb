# == Schema Information
#
# Table name: wiki_page_contacts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact_id :integer          not null
#  page_id    :integer          not null
#
# Indexes
#
#  index_wiki_page_contacts_on_contact_id  (contact_id)
#  index_wiki_page_contacts_on_page_id     (page_id)
#
module Wiki
  class PageContact < ApplicationRecord
    belongs_to :page
    belongs_to :contact
  end
end
