class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  def index
    @contacts = current_user.contacts.includes(:tags).page(params[:page])
  end

  # GET /contacts/1
  def show
  end

  # GET /contacts/new
  def new
    @contact = current_user.contacts.new new_contact_params
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  def create
    @contact = current_user.contacts.new(contact_params)
    @contact.tenant_id = current_user.tenant_id

    if @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def sidebar
    :contacts
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(
      :address,
      :birthday,
      :company_id,
      :description,
      :email,
      :first_name,
      :home_phone,
      :job_department,
      :job_title,
      :last_name,
      :mobile_phone,
      :nickname,
      :title,
      :website,
      :work_phone,
      :pronouns,
      tag_ids: [],
      custom_values_attributes: {}
    )
  end

  def new_contact_params
    params.permit(:company_id)
  end
end
