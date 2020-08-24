module PersonalLog
  class EntriesController < ApplicationController
    before_action :set_personal_log_entry, only: [:show, :edit, :update, :destroy]

    # GET /personal_log/entries
    # GET /personal_log/entries.json
    def index
      @personal_log_entries = entries.all
    end

    # GET /personal_log/entries/1
    # GET /personal_log/entries/1.json
    def show
    end

    # GET /personal_log/entries/new
    def new
      @personal_log_entry = entries.new
    end

    # GET /personal_log/entries/1/edit
    def edit
    end

    # POST /personal_log/entries
    # POST /personal_log/entries.json
    def create
      @personal_log_entry = entries.new(personal_log_entry_params)

      respond_to do |format|
        if @personal_log_entry.save
          format.html { redirect_to personal_log_entries_path, notice: 'Entry was successfully created.' }
          format.json { render :show, status: :created, location: @personal_log_entry }
        else
          format.html { render :new }
          format.json { render json: @personal_log_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /personal_log/entries/1
    # PATCH/PUT /personal_log/entries/1.json
    def update
      respond_to do |format|
        if @personal_log_entry.update(personal_log_entry_params)
          format.html { redirect_to @personal_log_entry, notice: 'Entry was successfully updated.' }
          format.json { render :show, status: :ok, location: @personal_log_entry }
        else
          format.html { render :edit }
          format.json { render json: @personal_log_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /personal_log/entries/1
    # DELETE /personal_log/entries/1.json
    def destroy
      @personal_log_entry.destroy
      respond_to do |format|
        format.html { redirect_to personal_log_entries_url, notice: 'Entry was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    def sidebar
      :personal_log
    end

    def entries
      current_user.personal_log_entries
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_personal_log_entry
      @personal_log_entry = entries.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personal_log_entry_params
      params.require(:personal_log_entry).permit(:content, :date)
    end
  end
end
