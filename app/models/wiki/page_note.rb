# == Schema Information
#
# Table name: wiki_page_notes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :integer          not null
#  page_id    :integer          not null
#
# Indexes
#
#  index_wiki_page_notes_on_note_id  (note_id)
#  index_wiki_page_notes_on_page_id  (page_id)
#
module Wiki
  class PageNote < ApplicationRecord
    belongs_to :page
    belongs_to :note
  end
end
