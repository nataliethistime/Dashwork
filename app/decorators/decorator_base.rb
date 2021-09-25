class DecoratorBase
  include DecoratorFormatters

  def helpers
    ApplicationController.helpers
  end

  def routes
    Rails.application.routes.url_helpers
  end

  def localize(*args, **kwargs)
    I18n.localize(*args, **kwargs)
  end

  def updated_at(item)
    localize item.updated_at, format: :short
  end

  def updated_at_ago(item)
    "#{helpers.time_ago_in_words(item.updated_at)} ago"
  end

  def created_at(item)
    localize item.created_at, format: :short
  end

  def created_at_ago(item)
    "#{helpers.time_ago_in_words(item.created_at)} ago"
  end
end
