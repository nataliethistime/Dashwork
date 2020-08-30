class NotificationComponent < ViewComponent::Base
  attr_reader :style

  def initialize(style:)
    @style = style
  end
end
