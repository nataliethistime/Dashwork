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
      #
      # TODO: I'm not sure why we need to manually create the linking item? I thought there was Rails
      # magic that handles it but can't find it right now...
      #
      tenant_links.create!(field: @field)
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
    link = tenant_links.find_by field_id: params[:id]
    link.destroy
    field.destroy
    redirect_to polymorphic_path([params[:domain], :fields]), notice: 'Successfully deleted custom field'
  end

  private

  def field_params
    params.require(:field).permit(:name)
  end

  #
  # Takes into account the domain and returns the association for the correct kind of field
  #
  def tenant_fields
    case params[:domain]
    when 'company'
      current_tenant.company_fields
    end
  end

  def tenant_links
    case params[:domain]
    when 'company'
      current_tenant.tenant_company_fields
    end
  end
end
