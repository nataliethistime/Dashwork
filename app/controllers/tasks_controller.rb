class TasksController < ApplicationController
  def index
    @q = current_user.tasks.uncompleted.includes(:tags, :company, :contact, :project).ransack(params[:q])
    @tasks = @q.result
  end

  def completed
    @tasks = current_user.tasks.completed.includes(:tags)
  end

  def show
    @task = current_user.tasks.find params[:id]
  end

  def new
    @task = current_user.tasks.new new_task_params
  end

  def edit
    @task = current_user.tasks.find params[:id]
  end

  def create
    @task = current_user.tasks.new(task_params)
    @task.tenant_id = current_user.tenant_id

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @task = current_user.tasks.find params[:id]
    if @task.update(task_params)
      path = params[:task][:redirect_to] || task_path(@task)
      redirect_to path, notice: 'Task was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @task = current_user.tasks.find params[:id]
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
