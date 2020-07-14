class CalendarEventDecorator < DecoratorBase
  def start_at(calendar_event)
    format calendar_event.start_at, as: :time
  end

  def end_at(calendar_event)
    format calendar_event.end_at, as: :time
  end
end
