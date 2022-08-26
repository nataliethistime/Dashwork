class CompaniesController < ApplicationController
  before_action :set_company, only: [
    :show,
    :show_notes,
    :show_contacts,
    :show_tasks,
    :show_projects,
    :edit,
    :update,
    :destroy
  ]

  # GET /companies
  def index
    @q = current_user.companies.ransack(params[:q])
    @companies = @q.result.page(params[:page])
  end

  # GET /companies/1
  def show
  end

  # GET /companies/new
  def new
    @company = current_user.companies.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = current_user.companies.new company_params
    @company.tenant_id = current_user.tenant_id

    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = current_user.companies.find(params[:id])
  end

  def sidebar
    :companies
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(
      :name,
      :description,
      :website,
      :email,
      :phone,
      :address,
      tag_ids: [],
      custom_values_attributes: {}
    )
  end
end
