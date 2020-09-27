class FormTemplateFieldsController < ApplicationController
  before_action :set_form_template

  def index
    @fields = @form_template.fields.page(params[:page])
  end

  def show
    @field = @form_template.fields.find(params[:id])
  end

  def new
    @field = @form_template.fields.new
  end

  def create
    @field = @form_template.fields.new form_field_params
    if @field.save
      redirect_to form_template_fields_path(@form_template), notice: 'Successfully created form field.'
    else
      render :new
    end
  end

  def edit
    @field = @form_template.fields.find(params[:id])
  end

  def update
    @field = @form_template.fields.find(params[:id])

    if @field.update form_field_params
      redirect_to form_template_field_path(@form_template, @field), notice: 'Successfully updated form field.'
    else
      render :edit
    end
  end

  def destroy
    @field = @form_template.fields.find(params[:id])
    @field.destroy
    redirect_to form_template_fields_path(@form_template), notice: 'Successfully delete form field.'
  end

  private

  def sidebar
    :forms
  end

  def set_form_template
    @form_template = current_tenant.form_templates.find(params[:form_template_id])
  end

  def form_field_params
    params.require(:form_template_field).permit(:label, :type)
  end
end
