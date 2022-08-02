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
module PersonalLog
  class Entry < ApplicationRecord
    belongs_to :user

    validates :content, presence: true
    validates :entered_at, presence: true

    decorate_with PersonalLogEntryDecorator

    include Geolocatable

    after_initialize do |personal_log_entry|
      personal_log_entry.entered_at ||= Time.zone.now
    end

    before_save do |e|
      #
      # Remove seconds and milliseconds. Makes form inputs easier to use because they don't handle
      # seconds in time stamps very well. For instance, currently in Chrome the seconds compoent is
      # greyed out and can't be changed (by typing or picking numbers in the UI).
      #
      e.entered_at = e.entered_at.change sec: 0, nsec: 0

      #
      # Very naive word count, but I think sufficient for my use case
      #
      e.word_count = e.content.split(' ').size
    end

    scope :on_day, -> (date) { where(entered_at: date..(date + 1.day)) }
    scope :recent, -> { where('entered_at > ?', Time.zone.now - 7.days) }
    default_scope -> { order(entered_at: :desc) }
  end
end
