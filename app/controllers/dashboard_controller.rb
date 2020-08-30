class DashboardController < ApplicationController
  def home
    params[:projects] ||= 'open'
    params[:tasks] ||= 'today'
    params[:contacts] ||= 'starred'
    params[:companies] ||= 'starred'

    @projects =
      case params[:projects]
      when 'open'
        current_tenant.projects.open.limit(5)
      when 'starred'
        current_user.starred_projects.limit(5)
      when 'new'
        current_tenant.projects.newly_created.limit(5)
      end

    @tasks =
      case params[:tasks]
      when 'today'
        current_tenant.tasks.due_before(Time.zone.tomorrow.beginning_of_day).limit(5)
      when 'new'
        current_tenant.tasks.newly_created.limit(5)
      end

    @contacts =
      case params[:contacts]
      when 'starred'
        current_user.starred_contacts.limit(5)
      when 'new'
        current_tenant.contacts.newly_created.limit(5)
      end

    @companies =
      case params[:companies]
      when 'starred'
        current_user.starred_companies.limit(5)
      when 'new'
        current_tenant.companies.newly_created.limit(5)
      end

    @filters = {
      projects: params[:projects],
      tasks: params[:tasks],
      contacts: params[:contacts],
      companies: params[:companies]
    }
  end

  private

  def sidebar
    :dashboard
  end
end
