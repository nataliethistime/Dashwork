class DashboardController < ApplicationController
  def home
    @entries = current_user.personal_log_entries.recent
    @tasks = current_user.tasks.scheduled.uncompleted.includes(:project, :company, :contact, :tags)
  end

  private

  def sidebar
    :dashboard
  end
end
