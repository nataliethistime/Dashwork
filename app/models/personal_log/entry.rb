# == Schema Information
#
# Table name: personal_log_entries
#
#  id         :bigint           not null, primary key
#  content    :text
#  entry_date :date
#  entry_time :time
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
    validates :entry_date, presence: true
    validates :entry_time, presence: true

    decorate_with PersonalLogEntryDecorator

    after_initialize do |personal_log_entry|
      now = Time.zone.now
      personal_log_entry.entry_date ||= now
      personal_log_entry.entry_time ||= now
    end

    before_save do |e|
      # Remove seconds and milliseconds from entry time
      e.entry_time = e.entry_time.change sec: 0, nsec: 0
    end

    scope :on_day, -> (date) { where(entry_date: date..(date + 1.day)) }
    default_scope -> { order(entry_date: :desc).order(entry_time: :desc) }
  end
end
