class CompanyGroupsController < ApplicationController
  def index
    @company_groups = current_tenant.company_groups.all
  end

  def show
    @company_group = current_tenant.company_groups.find params[:id]
    @companies = @company_group.companies.includes(:groups).page params[:page]
  end

  def new
    @company_group = current_tenant.company_groups.new
  end

  def create
    @company_group = current_tenant.company_groups.new company_group_params
    if @company_group.save
      redirect_to @company_group, notice: 'Successfully created group'
    else
      render 'new'
    end
  end

  def edit
    @company_group = current_tenant.company_groups.find params[:id]
  end

  def update
    @company_group = current_tenant.company_groups.find params[:id]
    @company_group.update company_group_params
    if @company_group.save
      redirect_to @company_group, notice: 'Successfully updated group'
    else
      render 'edit'
    end
  end

  def destroy
    @company_group = current_tenant.company_groups.find params[:id]
    @company_group.delete
    redirect_to company_groups_path, notice: 'Successfully deleted group'
  end

  private

  def company_group_params
    params.require(:company_group).permit(:name)
  end
end
