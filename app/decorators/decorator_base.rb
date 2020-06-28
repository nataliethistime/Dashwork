class DecoratorBase
  include DecoratorFormatters

  def helpers
    ApplicationController.helpers
  end

  def routes
    Rails.application.routes.url_helpers
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

  #
  # This is a hack, I think. The actions_for(item, :delete) handler calls item.name to get a name
  # to display in the confirmation message. We do this so that items that don't have an explicit name
  # (such as notes) just say, 'Are you sure you want to delete this note?' instead.
  #
  def name(item)
    if item.respond_to? :name
      item.name
    else
      "this #{item.model_name.singular}"
    end
  end
end
