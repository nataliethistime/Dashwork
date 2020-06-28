class NotesController < ApplicationController
  def index
    @q = current_tenant.notes.includes(:groups).ransack(params[:q])
    @notes = @q.result.page(params[:page])
  end

  def show
    @note = current_tenant.notes.find(params[:id])
  end

  def new
    @note = current_tenant.notes.new(new_note_params)
  end

  def edit
    @note = current_tenant.notes.find(params[:id])
  end

  def create
    @note = current_tenant.notes.new(note_params)
    @note.user = current_user

    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @note = current_tenant.notes.find(params[:id])
    if @note.update(note_params)
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @note = current_tenant.notes.find(params[:id])
    @note.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private

  def note_params
    params.require(:note).permit(:title, :content, :contact_id, :company_id, :project_id, group_ids: [])
  end

  def new_note_params
    params.permit(:contact_id, :company_id, :project_id)
  end
end
