class TagsController < ApplicationController
  before_action :set_type

  def index
    @tags = user_tags.all
  end

  def show
    @tag = user_tags.find params[:id]
    @items = @tag.public_send(@type_plural).includes(:tags).page params[:page]
  end

  def new
    @tag = user_tags.new
  end

  def create
    @tag = user_tags.new tag_params
    @tag.tenant_id = current_user.tenant_id
    if @tag.save
      redirect_to polymorphic_path([@type.to_sym, :tags]), notice: 'Successfully created tag'
    else
      render 'new'
    end
  end

  def edit
    @tag = user_tags.find params[:id]
  end

  def update
    @tag = user_tags.find params[:id]
    if @tag.update tag_params
      redirect_to polymorphic_path([@tag]), notice: 'Successfully updated tag'
    else
      render 'edit'
    end
  end

  def destroy
    @tag = user_tags.find params[:id]
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
  def user_tags
    current_user.public_send "#{@type}_tags"
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
