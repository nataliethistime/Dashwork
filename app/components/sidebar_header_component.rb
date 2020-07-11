class SidebarHeaderComponent < ViewComponent::Base
  def initialize(title)
    @title = title
  end

  def call
    "<p class='menu-label'>#{@title}</p>".html_safe
  end
end
