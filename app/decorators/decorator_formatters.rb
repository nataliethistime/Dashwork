module DecoratorFormatters
  def format(value, options = {})
    return '' unless value.present?

    if block_given?
      yield value
    elsif options[:as]
      send "format_#{options[:as]}", value
    else
      raise "Don't know how to format #{value.inspect} (given options: #{options.inspect})"
    end
  end

  def format_url(url)
    helpers.link_to url.gsub(/^https?:\/\//, ''), url, target: '_blank'
  end

  def format_phone_url(phone)
    helpers.link_to phone, "tel:#{phone}"
  end

  def format_email(email)
    helpers.link_to email, "mailto:#{email}"
  end

  def format_date(date)
    helpers.local_date date
  end
end
