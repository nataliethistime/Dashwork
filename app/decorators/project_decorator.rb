class ProjectDecorator < DecoratorBase
  def start_date(project)
    format project.start_date, as: :date
  end

  def end_date(project)
    format project.end_date, as: :date
  end

  def name_link(project)
    helpers.link_to project.name, routes.project_path(project)
  end

  def description(project)
    format project.description, as: :markdown
  end

  def tags(project)
    project.tags.collect(&:name).join ', '
  end

  def contacts(project)
    names = project.contacts
      .map { |c| "<li>#{helpers.link_to c.decorate(:name), routes.contact_path(c)}</li>" }
      .join ''
    "<div class='content'><ul>#{names}</ul></div>".html_safe
  end

  def companies(project)
    names = project.companies
      .map { |c| "<li>#{helpers.link_to c.decorate(:name), routes.company_path(c)}</li>" }
      .join ''
    "<div class='content'><ul>#{names}</ul></div>".html_safe
  end
end
