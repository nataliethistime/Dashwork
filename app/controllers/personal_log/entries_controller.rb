module PersonalLog
  class EntriesController < ApplicationController
    before_action :set_personal_log_entry, only: [:show, :edit, :update, :destroy]

    # GET /personal_log/entries
    # GET /personal_log/entries.json
    def index
      if params[:q]
        query = '%' + params[:q] + '%'
        @personal_log_entries = entries.all.where('content LIKE ?', query).page(params[:page])
      else
        @personal_log_entries = entries.all.page(params[:page])
      end
    end

    # GET /personal_log/entries/review
    def review
      @days = {
        week: Time.zone.today.beginning_of_day - 7.days,
        month: Time.zone.today.prev_month.beginning_of_day,
        year: Time.zone.today.prev_year.beginning_of_day
      }
      @periods = @days.keys
      @entries = {}

      @periods.each do |period|
        @entries[period] = entries.on_day(@days[period])
      end
    end

    # GET /personal_log/entries/export
    def export
      respond_to do |format|
        format.html
        format.md { @entries = entries.all }
        format.json { @entries = entries.all }
      end
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
      params.require(:personal_log_entry).permit(:content, :entry_date, :entry_time)
    end
  end
end
