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
      redirect_to polymorphic_path([params[:domain], :fields])
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
    @field.update company_field_params

    if @field.save
      redirect_to polymorphic_path([params[:domian], @field])
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
    params.require(:field).permit(:name, :type)
  end

  #
  # Takes into account the domain and returns the association for the correct kind of field
  #
  def tenant_fields
    current_tenant.fields.where domain: params[:domain]
  end
end
