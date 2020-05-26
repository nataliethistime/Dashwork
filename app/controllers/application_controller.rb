class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_tenant

  def home
  end

  def current_tenant
    current_user&.tenant
  end

  private

  def check_tenant
    if user_signed_in? && current_tenant.nil?
      redirect_to new_tenant_path unless helpers.current_page?(new_tenant_path)
    end
  end
end
