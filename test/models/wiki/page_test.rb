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
require 'test_helper'

class Wiki::PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
