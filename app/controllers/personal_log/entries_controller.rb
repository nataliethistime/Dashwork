module PersonalLog
  class EntriesController < ApplicationController
    before_action :set_personal_log_entry, only: [:show, :edit, :update, :destroy]

    # GET /personal_log/entries
    def index
      if params[:q]
        query = '%' + params[:q] + '%'
        @personal_log_entries = entries.all.where('content LIKE ?', query).page(params[:page]).includes(:geolocation)
      else
        @personal_log_entries = entries.all.page(params[:page]).includes(:geolocation)
      end
    end

    # GET /personal_log/entries/timeline
    def timeline
      @entries = entries.all.without_order.order(entered_at: :asc)
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
    # GET /personal_log/entries/export.md
    # GET /personal_log/entries/export.txt
    def export
      respond_to do |format|
        format.html
        format.md { @entries = entries.all }
        format.text { @entries = entries.all }
      end
    end

    # GET /personal_log/entries/1
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
    def create
      @personal_log_entry = entries.new(personal_log_entry_params)

      if @personal_log_entry.save
        redirect_to personal_log_entries_path, notice: 'Entry was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /personal_log/entries/1
    def update
      if @personal_log_entry.update(personal_log_entry_params)
        redirect_to @personal_log_entry, notice: 'Entry was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /personal_log/entries/1
    def destroy
      @personal_log_entry.destroy
      redirect_to personal_log_entries_url, notice: 'Entry was successfully destroyed.'
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
      params.require(:personal_log_entry).permit(:content, :entered_at, geolocation_attributes: [
        :longitude,
        :latitude,
      ])
    end
  end
end
