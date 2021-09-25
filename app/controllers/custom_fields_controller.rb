class CustomFieldsController < ApplicationController
  before_action :set_domain

  def index
    @fields = tenant_fields.all
  end

  def new
    @field = tenant_fields.new
  end

  def create
    @field = tenant_fields.new field_params

    if @field.save
      redirect_to polymorphic_path([:custom, @domain.to_sym, :fields]), notice: 'Successfully created field'
    else
      render 'new'
    end
  end

  def show
    @field = tenant_fields.find params[:id]
  end

  def edit
    @field = tenant_fields.find params[:id]
  end

  def update
    @field = tenant_fields.find params[:id]

    if @field.update field_params
      redirect_to polymorphic_path([@field]), notice: 'Successfully updated field'
    else
      render 'edit'
    end
  end

  def destroy
    field = tenant_fields.find params[:id]
    field.destroy
    redirect_to polymorphic_path([:custom, @domain.to_sym, :fields]), notice: 'Successfully deleted custom field'
  end

  private

  def field_params
    params.require(:"custom_#{@domain}_field").permit(:name, :type)
  end

  #
  # Takes into account the domain and returns the association for the correct kind of field
  #
  def tenant_fields
    current_user.public_send "custom_#{@domain}_fields"
  end

  def sidebar
    params[:domain].pluralize(2)
  end

  def set_domain
    @domain = params[:domain]
    raise 'Domain must be specified when using the fields controller' if @domain.blank?
    @domain_plural = @domain.pluralize(2)
  end
end
