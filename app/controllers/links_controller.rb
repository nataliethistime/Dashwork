class LinksController < ApplicationController
  before_action :set_type
  before_action :set_parent

  def contacts
    @contacts = @parent.contacts.includes(:tags).page(params[:page])
  end

  def notes
    @notes = @parent.notes.includes(:user, :tags).page(params[:page])
  end

  def projects
    @projects = @parent.projects
  end

  def tasks
    @tasks = @parent.tasks
  end

  private

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
    case @type
    when 'company'
      Company
    when 'contact'
      Contact
    else
      raise "Invalid type: #{@type.inspect}"
    end
  end
end
