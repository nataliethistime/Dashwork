class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_tenant
  before_action :set_sidebar

  def home
    @sidebar = :application
  end

  def current_tenant
    current_user&.tenant
  end

  private

  #
  # Override this method to set the sidebar in your controllers. Alternitively you can set @sidebar
  # within individual actions when you need to.
  #
  def sidebar
    nil
  end

  def set_sidebar
    @sidebar = sidebar
  end

  def check_tenant
    if user_signed_in? && current_tenant.nil?
      redirect_to new_tenant_path unless helpers.current_page?(new_tenant_path)
    end
  end
end
