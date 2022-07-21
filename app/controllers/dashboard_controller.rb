class DashboardController < ApplicationController
  def home
    @entries = PersonalLog::Entry.recent
    @tasks = Task.scheduled.uncompleted.includes(:project, :company, :contact, :tags)
  end

  private

  def sidebar
    :dashboard
  end
end
