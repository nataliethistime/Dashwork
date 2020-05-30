class TasksController < ApplicationController
  def index
    @tasks = current_tenant.tasks.all
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
    @task = current_user.tasks.new(task_params)
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

  def task_params
    params.require(:task).permit(:name, :description, :due_date, :completed, :user_id, :project_id)
  end

  def new_task_params
    params.permit(:project_id)
  end
end
