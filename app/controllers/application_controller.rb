class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_sidebar
  around_action :set_time_zone

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

  def set_time_zone
    Time.use_zone(current_user&.time_zone || 'UTC') { yield }
  end

  def after_sign_in_path_for(_resource)
    dashboard_home_path
  end
end
