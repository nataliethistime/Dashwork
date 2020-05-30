class DecoratorBase
  include DecoratorFormatters

  def helpers
    ApplicationController.helpers
  end

  def updated_at(item)
    helpers.local_relative_time item.updated_at, type: 'time-or-date'
  end

  def updated_at_ago(item)
    "#{helpers.time_ago_in_words(item.updated_at)} ago"
  end

  def created_at(item)
    helpers.local_relative_time item.created_at, type: 'time-or-date'
  end

  def created_at_ago(item)
    "#{helpers.time_ago_in_words(item.created_at)} ago"
  end
end
