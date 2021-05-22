class CreateActionComponent < ViewComponent::Base
  attr_reader :path

  def initialize(path:)
    @path = path
  end

  def create_icon
    helpers.icon_for :create
  end
end
