module DecoratorFormatters
  def format(value, options = {})
    return '' if value.blank?

    if block_given?
      yield value
    elsif options[:as]
      send "format_#{options[:as]}", value
    else
      raise "Don't know how to format #{value.inspect} (given options: #{options.inspect})"
    end
  end

  def format_url(url)
    helpers.link_to url.gsub(%r{^https?://}, ''), url, target: '_blank', rel: 'noopener noreferrer'
  end

  def format_phone_url(phone)
    helpers.link_to phone, "tel:#{phone}"
  end

  def format_email(email)
    helpers.link_to email, "mailto:#{email}"
  end

  def format_date(date)
    localize date, format: '%B %d, %Y'
  end

  def format_time(time)
    localize time, format: '%l:%M%P'
  end

  def format_google_maps_search_link(query)
    helpers.link_to query, "https://www.google.com/maps?q=#{query}", target: '_blank', rel: 'noopener noreferrer'
  end

  def format_markdown(text = '')
    redcarpet = Redcarpet::Markdown.new(
      Redcarpet::Render::HTML.new(
        filter_html: true,
        no_styles: true,
        prettify: true,
        link_attributes: {
          target: '_blank',
          rel: 'noopener noreferrer'
        }
      ),
      no_intra_emphasis: true,
      autolink: true,
      strikethrough: true,
      space_after_headers: true,
      underline: true,
      highlight: true,
      fenced_code_blocks: true,
      tables: true,
    )
    helpers.content_tag :div, redcarpet.render(text).html_safe, class: 'content'
  end

  def format_currency(number)
    helpers.number_to_currency number, unit: '$'
  end

  def format_commified_number(number)
    helpers.number_with_delimiter(number, delimiter: ',')
  end
end
