class SeparateDateAndTimeFieldsForEntry < ActiveRecord::Migration[6.0]
  def change
    change_table :personal_log_entries do |t|
      t.date :entry_date
      t.time :entry_time
    end

    PersonalLog::Entry.all.each do |entry|
      entry.entry_date = entry.date
      entry.entry_time = entry.date
      entry.save!
    end
  end
end
