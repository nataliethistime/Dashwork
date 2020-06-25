class CompanyDecorator < DecoratorBase
  def description(company)
    format company.description, as: :markdown
  end

  def website(company)
    format company.website, as: :url
  end

  def email(company)
    format company.email, as: :email
  end

  def phone(company)
    format company.phone, as: :phone_url
  end

  def address(company)
    format company.address, as: :google_maps_search_link
  end

  def groups(company)
    company.groups.collect(&:name).join ', '
  end

  def name_link(company)
    helpers.link_to company.name, routes.company_path(company)
  end
end
