module ApplicationHelper
  def current_tenant
    current_user&.tenant
  end

  def icon_for(name)
    icon = EnvSettings.icons[name.to_s]
    tag.i class: icon if icon.present?
  end
end
