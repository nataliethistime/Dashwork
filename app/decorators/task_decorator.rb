module TaskDecorator
  extend DecoratorBase
  extend self

  def completed(task)
    task.completed.presence == true ? 'Yes' : 'No'
  end

  def due_date(task)
    helpers.local_time_ago(task.due_date)
  end
end
