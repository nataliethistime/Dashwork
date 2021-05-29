class TagsController < ApplicationController
  before_action :set_type

  def index
    @tags = tenant_tags.all
  end

  def show
    @tag = tenant_tags.find params[:id]
    @items = @tag.public_send(@type_plural).includes(:tags).page params[:page]
  end

  def new
    @tag = tenant_tags.new
  end

  def create
    @tag = tenant_tags.new tag_params
    if @tag.save
      redirect_to polymorphic_path([@type.to_sym, :tags]), notice: 'Successfully created tag'
    else
      render 'new'
    end
  end

  def edit
    @tag = tenant_tags.find params[:id]
  end

  def update
    @tag = tenant_tags.find params[:id]
    if @tag.update tag_params
      redirect_to polymorphic_path([@tag]), notice: 'Successfully updated tag'
    else
      render 'edit'
    end
  end

  def destroy
    @tag = tenant_tags.find params[:id]
    @tag.delete
    redirect_to polymorphic_path([@type.to_sym, :tags]), notice: 'Successfully deleted tag'
  end

  private

  def tag_params
    params.require(:"#{@type}_tag").permit(:name)
  end

  #
  # Takes into account the type and returns the association for the correct kind of field
  #
  def tenant_tags
    current_tenant.public_send "#{@type}_tags"
  end

  def sidebar
    params[:type].pluralize(2)
  end

  def set_type
    @type = params[:type]
    @type_plural = @type.pluralize(2)
  rescue StandardError
    raise 'Type must be specified when using the tags controller'
  end
end
