class EditActionComponent < ViewComponent::Base
  attr_reader :path

  def initialize(path:)
    @path = path
  end

  def edit_icon
    helpers.icon_for :edit
  end
end
