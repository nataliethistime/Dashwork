class ContactDecorator < DecoratorBase
  def name(contact)
    [
      contact.title.presence,
      contact.first_name.presence,
      contact.last_name.presence,
      contact.nickname.present? ? "(#{contact.nickname})" : ''
    ].filter(&:present?).join ' '
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

  def work_phone(contact)
    format contact.work_phone, as: :phone_url
  end

  def home_phone(contact)
    format contact.home_phone, as: :phone_url
  end

  def mobile_phone(contact)
    format contact.mobile_phone, as: :phone_url
  end

  def address(contact)
    format contact.address, as: :google_maps_search_link
  end

  def birthday(contact)
    format contact.birthday, as: :date
  end

  def department(contact)
    contact.job_department
  end
end
