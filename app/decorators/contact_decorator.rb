module ContactDecorator
  extend DecoratorBase
  extend self

  def name(contact)
    [contact.title.presence, contact.first_name.presence, contact.last_name.presence].join ' '
  end

  def website(contact)
    return '' unless contact.website.present?
    helpers.link_to clean_url(contact.website), contact.website
  end

  def email(contact)
    return '' unless contact.email.present?
    helpers.link_to contact.email, "mailto:#{contact.email}"
  end

  def phone(contact)
    phone = contact.work_phone.presence || contact.mobile_phone.presence || contact.home_phone.presence
    return '' if phone.nil?
    helpers.link_to phone, "tel:#{phone}"
  end
end
