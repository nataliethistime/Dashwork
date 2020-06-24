class TaskDecorator < DecoratorBase
  def completed(task)
    task.completed.presence == true ? 'Yes' : 'No'
  end

  def due_date(task)
    task.due_date.present? ? helpers.local_time_ago(task.due_date) : nil
  end
end
