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
  # GET /companies.json
  def index
    @q = current_tenant.companies.ransack(params[:q])
    @companies = @q.result.includes(:tags).page(params[:page])
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  def show_notes
  end

  def show_contcts
  end

  def show_tasks
  end

  def show_projects
  end

  # GET /companies/new
  def new
    @company = current_tenant.companies.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = current_tenant.companies.new company_params
    @company.user = current_user

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = current_tenant.companies.find(params[:id])
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
