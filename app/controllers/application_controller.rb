class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_tenant
  before_action :set_sidebar
  around_action :set_time_zone

  private

  def current_tenant
    current_user&.tenant
  end

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

  def set_time_zone
    Time.use_zone(current_user&.time_zone || 'UTC') { yield }
  end

  def after_sign_in_path_for(_resource)
    dashboard_home_path
  end
end
