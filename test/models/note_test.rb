# == Schema Information
#
# Table name: notes
#
#  id                :integer          not null, primary key
#  content           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  calendar_event_id :integer
#  company_id        :integer
#  contact_id        :integer
#  equipment_id      :integer
#  project_id        :integer
#  task_id           :integer
#  tenant_id         :integer          not null
#  user_id           :integer          not null
#  wiki_page_id      :integer
#
# Indexes
#
#  index_notes_on_wiki_page_id  (wiki_page_id)
#
require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
