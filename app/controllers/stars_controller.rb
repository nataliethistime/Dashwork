class StarsController < ApplicationController
  before_action :set_type

  def index
    @stars = starred.all.page(params[:page])
  end

  def toggle
    item = items.find params[:id]
    item.toggle_star_for current_user
    redirect_to polymorphic_path([item])
  end

  private

  def starred
    current_user.public_send "starred_#{@type_plural}"
  end

  def items
    current_tenant.public_send @type_plural
  end

  def sidebar
    params[:type].pluralize(2)
  end

  def set_type
    @type = params[:type]
    @type_plural = @type.pluralize(2)
  rescue StandardError
    raise 'Type must be specified when referencing the starrable controller'
  end
end
