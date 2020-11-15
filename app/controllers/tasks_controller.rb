class TasksController < ApplicationController
  def index
    @q = current_tenant.tasks.uncompleted.includes(:tags).ransack(params[:q])
    @tasks = @q.result
  end

  def completed
    @tasks = current_tenant.tasks.completed.includes(:tags)
  end

  def show
    @task = current_tenant.tasks.find params[:id]
  end

  def new
    @task = current_tenant.tasks.new new_task_params
  end

  def edit
    @task = current_tenant.tasks.find params[:id]
  end

  def create
    @task = current_tenant.tasks.new(task_params)
    @task.user = current_user

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @task = current_tenant.tasks.find params[:id]
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @task = current_tenant.tasks.find params[:id]
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private

  def sidebar
    :tasks
  end

  def task_params
    params.require(:task).permit(
      :name,
      :description,
      :due_date,
      :completed,
      :user_id,
      :contact_id,
      :company_id,
      :project_id,
      :tag_ids,
      tag_ids: []
    )
  end

  def new_task_params
    params.permit(:contact_id, :company_id, :project_id)
  end
end
