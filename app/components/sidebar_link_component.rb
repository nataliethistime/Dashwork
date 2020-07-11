class SidebarLinkComponent < ViewComponent::Base
  def initialize(icon, title, link, **opts)
    @icon = icon
    @title = title
    @link = link
    @opts = opts || {}
  end
end
