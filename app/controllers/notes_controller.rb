class NotesController < ApplicationController
  def index
    @q = current_user.notes.includes(:tags, :contact, :company, :project).ransack(params[:q])
    @notes = @q.result.page(params[:page])
  end

  def show
    @note = current_user.notes.find(params[:id])
  end

  def new
    @note = current_user.notes.new(new_note_params)
  end

  def edit
    @note = current_user.notes.find(params[:id])
  end

  def create
    @note = current_user.notes.new(note_params)
    @note.tenant_id = current_user.tenant_id

    if @note.save
      redirect_to @note, notice: 'Note was successfully created.'
    else
      render 'new'
    end
  end

  def update
    @note = current_user.notes.find(params[:id])
    if @note.update(note_params)
      redirect_to @note, notice: 'Note was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    @note = current_user.notes.find(params[:id])
    @note.destroy
    redirect_to notes_url, notice: 'Note was successfully destroyed.'
  end

  private

  def note_params
    params.require(:note).permit(
      :title,
      :content,
      :contact_id,
      :company_id,
      :project_id,
      :wiki_page_id,
      tag_ids: []
    )
  end

  def new_note_params
    params.permit(
      :contact_id,
      :company_id,
      :project_id,
      :wiki_page_id
    )
  end

  def sidebar
    :notes
  end
end
