class ProjectDecorator < DecoratorBase
  def start_date(project)
    format project.start_date, as: :date
  end

  def end_date(project)
    format project.end_date, as: :date
  end
end
