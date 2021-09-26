class PersonalLogEntryDecorator < DecoratorBase
  def content(personal_log_entry)
    format personal_log_entry.content, as: :markdown
  end

  def time(personal_log_entry)
    localize personal_log_entry.entered_at, format: '%-l:%M %P'
  end

  def day(personal_log_entry)
    localize personal_log_entry.entered_at, format: '%A %B %e, %Y'
  end

  def date(personal_log_entry)
    localize personal_log_entry.entered_at, format: '%-l:%M %P %A %B %e, %Y'
  end
end
