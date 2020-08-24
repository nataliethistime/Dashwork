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
module PersonalLog
  class Entry < ApplicationRecord
    belongs_to :user

    validates :content, presence: true
    validates :date, presence: true

    decorate_with PersonalLogEntryDecorator

    after_initialize do |personal_log_entry|
      personal_log_entry.date ||= Time.zone.now
    end

    default_scope -> { order(date: :desc) }
  end
end
