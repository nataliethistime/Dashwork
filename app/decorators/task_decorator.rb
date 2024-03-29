class TaskDecorator < DecoratorBase
  def completed(task)
    task.completed.presence == true ? 'Yes' : 'No'
  end

  def due_date(task)
    format task.due_date, as: :date
  end

  def description(task)
    format task.description, as: :markdown
  end

  def tags(task)
    task
      .tags
      .collect(&:name)
      .join ', '
  end
end
