class PersonalLogEntryDecorator < DecoratorBase
  def content(personal_log_entry)
    format personal_log_entry.content, as: :markdown
  end

  def time(personal_log_entry)
    localize personal_log_entry.entered_at, format: '%-l:%M %P'
  end

  def entered_at_ago(personal_log_entry)
    "#{helpers.time_ago_in_words(personal_log_entry.entered_at)} ago"
  end

  def long_day(personal_log_entry)
    localize personal_log_entry.entered_at, format: '%A %B %e, %Y'
  end

  def short_day(personal_log_entry)
    localize personal_log_entry.entered_at, format: '%B %e %Y'
  end

  def date(personal_log_entry)
    localize personal_log_entry.entered_at, format: '%-l:%M %P %A %B %e, %Y'
  end

  def word_count(personal_log_entry)
    format personal_log_entry.word_count, as: :commified_number
  end
end
