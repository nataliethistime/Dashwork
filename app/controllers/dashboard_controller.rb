class DashboardController < ApplicationController
  def home
    @entries = PersonalLog::Entry.recent
  end

  private

  def sidebar
    :dashboard
  end
end
