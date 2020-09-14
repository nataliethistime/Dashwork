class CalendarEventDecorator < DecoratorBase
  def start_at(calendar_event)
    format calendar_event.start_at, as: :time
  end

  def end_at(calendar_event)
    format calendar_event.end_at, as: :time
  end

  def companies(calendar_event)
    calendar_event.companies.collect(&:name).join ', '
  end

  def contacts(calendar_event)
    calendar_event.contacts.collect(&:name).join ', '
  end

  def projects(calendar_event)
    calendar_event.projects.collect(&:name).join ', '
  end
end
