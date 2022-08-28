class LinksController < ApplicationController
  before_action :set_type
  before_action :set_parent

  def contacts
    @contacts = @parent.contacts.includes(:tags).page(params[:page])
  end

  def notes
    @notes = @parent.notes.includes(:tags, :contact, :company, :project).page(params[:page])
  end

  def projects
    @projects = @parent.projects.includes(:tags).page(params[:page])
  end

  def tasks
    @tasks = @parent.tasks
  end

  private

  VALID_TYPES = %w{company contact project}.freeze

  def set_type
    @type = params.fetch(:type).to_s
    @type_plural = @type.pluralize(2)
  end

  def set_parent
    @parent = parent
  end

  def sidebar
    params[:type].pluralize(2)
  end

  def parent
    model.find params[:id]
  end

  def model
    raise "Invalid type: #{@type.inspect}" unless VALID_TYPES.include?(@type)
    @type.capitalize.constantize
  end
end
