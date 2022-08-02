# == Schema Information
#
# Table name: personal_log_entries
#
#  id         :integer          not null, primary key
#  content    :text
#  entered_at :datetime
#  entry_date :date
#  entry_time :time
#  word_count :integer          default(0)
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
