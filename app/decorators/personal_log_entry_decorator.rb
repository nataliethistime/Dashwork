class PersonalLogEntryDecorator < DecoratorBase
  def content(personal_log_entry)
    format personal_log_entry.content, as: :markdown
  end

  def time(personal_log_entry)
    localize personal_log_entry.entry_time, format: '%-l:%M %P'
  end

  def day(personal_log_entry)
    localize personal_log_entry.entry_date, format: '%A %B %e, %Y'
  end

  def date(personal_log_entry)
    date = format personal_log_entry.entry_date, as: :date
    time = format personal_log_entry.entry_time, as: :time
    "#{time} #{date}"
  end
end
