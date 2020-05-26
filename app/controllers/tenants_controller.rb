class TenantsController < ApplicationController
  skip_before_action :check_tenant, only: [:new, :create]

  def new
    @tenant = Tenant.new
  end

  def create
    @tenant = Tenant.new tenant_params

    if @tenant.save
      current_user.update_attribute :tenant_id, @tenant.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def tenant_params
    params.require(:tenant).permit(:name)
  end
end
