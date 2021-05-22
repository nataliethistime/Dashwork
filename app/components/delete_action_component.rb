class DeleteActionComponent < ViewComponent::Base
  attr_reader :path, :model_name

  def initialize(path:, model_name:)
    @path = path
    @model_name = model_name
  end

  def delete_icon
    helpers.icon_for :delete
  end

  def deletion_message
    "Are you sure you want to delete this #{@model_name}?"
  end
end
