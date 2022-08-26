class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    @q = current_user.projects.active.includes(:tags).ransack(params[:q])
    @projects = @q.result.page(params[:page])
  end

  # GET /projects/closed
  def closed
    @q = current_user.projects.closed.includes(:tags).ransack(params[:q])
    @projects = @q.result.page(params[:page])
  end

  # GET /projects/1
  def show
    @notes = @project.notes.includes(:user, :tags, :contact, :company).page(params[:notes_page])
  end

  # GET /projects/new
  def new
    @project = current_user.projects.new new_project_params
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = current_user.projects.new(project_params)
    @project.tenant_id = current_user.tenant_id

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private

  def sidebar
    :projects
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = current_user.projects.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(
      :name,
      :description,
      :start_date,
      :end_date,
      :status,
      :company_ids,
      :contact_ids,
      tag_ids: [],
      company_ids: [],
      contact_ids: [],
      custom_values_attributes: {}
    )
  end

  def new_project_params
    params.permit(contact_ids: [], company_ids: [])
  end
end
