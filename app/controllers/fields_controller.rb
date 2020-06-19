class FieldsController < ApplicationController
  def index
    @fields = tenant_fields.all
  end

  def new
    @field = tenant_fields.new
  end

  def create
    @field = tenant_fields.new field_params

    if @field.save
      redirect_to polymorphic_path([params[:domain], :fields]), 'Successfully created field'
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
      redirect_to polymorphic_path(@field), notice: 'Successfully updated field'
    else
      render 'edit'
    end
  end

  def destroy
    field = tenant_fields.find params[:id]
    field.destroy
    redirect_to polymorphic_path([params[:domain], :fields]), notice: 'Successfully deleted custom field'
  end

  private

  def field_params
    params.require(:"#{params[:domain]}_field").permit(:name, :type)
  end

  #
  # Takes into account the domain and returns the association for the correct kind of field
  #
  def tenant_fields
    current_tenant.public_send "#{params[:domain]}_fields"
  end
end
