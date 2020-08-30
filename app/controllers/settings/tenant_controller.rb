class Settings::TenantController < ApplicationController
  skip_before_action :check_tenant, only: [:new, :create]

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new tenant_params

    if @tenant.save
      current_user.update_attribute :tenant_id, @tenant.id
      redirect_to dashboard_home_path
    else
      render 'new'
    end
  end

  def edit
    @tenant = current_tenant
  end

  def edit_apps
    @tenant = current_tenant
  end

  def update
    @tenant = current_tenant
    @tenant.update tenant_params

    if @tenant.save
      redirect_to dashboard_home_path, notice: 'Successfully updated your tenant settings'
    else
      render 'edit'
    end
  end

  private

  def tenant_params
    params.require(:tenant).permit(:name, *app_names_as_params)
  end

  def sidebar
    :settings
  end

  def app_names_as_params
    Tenant.all_apps.dup.map { |app| "#{app}_app" }
  end
end
