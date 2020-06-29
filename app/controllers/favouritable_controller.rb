class FavouritableController < ApplicationController
  before_action :set_favouritable

  def index
    @favourites = favouritables.page(params[:page])
  end

  def toggle
    item = items.find params[:id]
    item.toggle_favourite_for current_user
    redirect_to polymorphic_path([item])
  end

  private

  def favouritables
    current_user.public_send "favourite_#{@favouritable_plural}"
  end

  def items
    current_tenant.public_send @favouritable_plural
  end

  def set_favouritable
    @favouritable = params[:favouritable]
    @favouritable_plural = @favouritable.pluralize(2)
  rescue StandardError
    raise 'Domain must be specified when referencing the favourites controller'
  end
end
