class ContactDecorator < DecoratorBase
  def name(contact)
    [contact.title.presence, contact.first_name.presence, contact.last_name.presence].join ' '
  end

  def website(contact)
    format contact.website, as: :url
  end

  def email(contact)
    format contact.email, as: :email
  end

  def phone(contact)
    phone = contact.work_phone.presence || contact.mobile_phone.presence || contact.home_phone.presence
    format phone, as: :phone_url
  end
end
