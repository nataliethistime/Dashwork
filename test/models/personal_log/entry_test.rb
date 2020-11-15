# == Schema Information
#
# Table name: personal_log_entries
#
#  id         :bigint           not null, primary key
#  content    :text
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tenant_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_personal_log_entries_on_tenant_id  (tenant_id)
#  index_personal_log_entries_on_user_id    (user_id)
#
require 'test_helper'

class PersonalLog::EntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end