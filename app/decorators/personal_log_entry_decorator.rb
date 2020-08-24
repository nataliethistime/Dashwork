class PersonalLogEntryDecorator < DecoratorBase
  def content(personal_log_entry)
    format personal_log_entry.content, as: :markdown
  end

  def date(personal_log_entry)
    format personal_log_entry.date, as: :time
  end
end
