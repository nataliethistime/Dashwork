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

  def address(company)
    format company.address, as: :google_maps_search_link
  end

  def groups(company)
    company.groups.collect(&:name).join ','
  end
end
