class DashboardController < ApplicationController
  def home
    week_start = Time.zone.today.beginning_of_week(:sunday)
    week_end = week_start + 7.days
    @entries = PersonalLog::Entry.recent
    @tasks = Task.where(due_date: week_start..week_end)
  end
end
