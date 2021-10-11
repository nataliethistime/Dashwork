# == Schema Information
#
# Table name: project_contacts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  contact_id :bigint
#  project_id :bigint
#
# Indexes
#
#  index_project_contacts_on_contact_id  (contact_id)
#  index_project_contacts_on_project_id  (project_id)
#
require 'test_helper'

class ProjectContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
