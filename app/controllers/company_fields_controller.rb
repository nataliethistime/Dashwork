class CompanyFieldsController < ApplicationController
  def index
    @fields = current_tenant.company_fields
  end

  def new
    @field = current_tenant.company_fields.new
  end

  def create
    @field = current_tenant.company_fields.new company_field_params

    if @field.save
      redirect_to company_fields_path
    else
      render 'new'
    end
  end

  def show
    @field = current_tenant.company_fields.find params[:id]
  end

  def edit
    @field = current_tenant.company_fields.find params[:id]
  end

  def update
    @field = current_tenant.company_fields.find params[:id]
    @field.update company_field_params

    if @field.save
      redirect_to company_field_path(@field)
    else
      render 'edit'
    end
  end

  private

  def company_field_params
    params.require(:company_field).permit(:name)
  end
end
