class PersonalLogEntryDecorator < DecoratorBase
  def content(personal_log_entry)
    format personal_log_entry.content, as: :markdown
  end

  def time(personal_log_entry)
    helpers.local_time personal_log_entry.date, format: '%l:%M%P'
  end

  def day(personal_log_entry)
    helpers.local_date personal_log_entry.date
  end
end
