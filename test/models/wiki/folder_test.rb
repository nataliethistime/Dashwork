# == Schema Information
#
# Table name: wiki_folders
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :bigint
#  tenant_id  :bigint
#
# Indexes
#
#  index_wiki_folders_on_tenant_id  (tenant_id)
#
require 'test_helper'

class Wiki::FolderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
