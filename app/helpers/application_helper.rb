module ApplicationHelper
  def current_tenant
    current_user&.tenant
  end
end
