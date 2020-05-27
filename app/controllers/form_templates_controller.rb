class FormTemplatesController < ApplicationController
  before_action :set_form_template, only: [:show, :edit, :update, :destroy]

  # GET /form_templates
  # GET /form_templates.json
  def index
    @form_templates = current_tenant.form_templates.all
  end

  # GET /form_templates/1
  # GET /form_templates/1.json
  def show
  end

  # GET /form_templates/new
  def new
    @form_template = current_tenant.form_templates.new
  end

  # GET /form_templates/1/edit
  def edit
  end

  # POST /form_templates
  # POST /form_templates.json
  def create
    @form_template = current_tenant.form_templates.new(form_template_params)

    respond_to do |format|
      if @form_template.save
        format.html { redirect_to @form_template, notice: 'Form template was successfully created.' }
        format.json { render :show, status: :created, location: @form_template }
      else
        format.html { render :new }
        format.json { render json: @form_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_templates/1
  # PATCH/PUT /form_templates/1.json
  def update
    respond_to do |format|
      if @form_template.update(form_template_params)
        format.html { redirect_to @form_template, notice: 'Form template was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_template }
      else
        format.html { render :edit }
        format.json { render json: @form_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_templates/1
  # DELETE /form_templates/1.json
  def destroy
    @form_template.destroy
    respond_to do |format|
      format.html { redirect_to form_templates_url, notice: 'Form template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_form_template
    @form_template = current_tenant.form_templates.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def form_template_params
    params.require(:form_template).permit(:name)
  end
end
