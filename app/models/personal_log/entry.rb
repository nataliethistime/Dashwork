# == Schema Information
#
# Table name: personal_log_entries
#
#  id         :bigint           not null, primary key
#  content    :text
#  entered_at :datetime
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
    validates :entered_at, presence: true
    validates :entry_date, presence: true
    validates :entry_time, presence: true

    validate :entered_at_valid

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

    def entered_at_valid
      if entered_at.year != entry_date.year
        errors.add(:base, 'entered_at year does not match')
      end

      if entered_at.month != entry_date.month
        errors.add(:base, 'entered_at month does not match')
      end

      if entered_at.day != entry_date.day
        errors.add(:base, 'entered_at day does not match')
      end

      if entered_at.hour != entry_time.hour
        errors.add(:base, 'entered_at hour does not match')
      end

      if entered_at.min != entry_time.min
        errors.add(:base, 'entered_at min does not match')
      end
    end
  end
end
