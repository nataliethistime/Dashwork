class FixAgain < ActiveRecord::Migration[6.0]
  def change
    PersonalLog::Entry.all.each do |e|
      e.entered_at = Time.zone.today.to_time.change(
        year: e.entry_date.year,
        month: e.entry_date.month,
        day: e.entry_date.day,
        hour: e.entry_time.hour,
        min: e.entry_time.min,
        sec: 0,
        nsec: 0
      )
      e.save!
    end
  end
end
