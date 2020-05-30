class CompanyDecorator < DecoratorBase
  def website(contact)
    format contact.website, as: :url
  end

  def email(contact)
    format contact.email, as: :email
  end

  def phone(contact)
    format contact.phone, as: :phone_url
  end
end
