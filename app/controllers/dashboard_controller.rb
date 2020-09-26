class DashboardController < ApplicationController
  def home
    @projects = projects
    @tasks = tasks
    @contacts = contacts
    @companies = companies

    @filters = {
      projects: params[:projects],
      tasks: params[:tasks],
      contacts: params[:contacts],
      companies: params[:companies]
    }
  end

  private

  def projects
    params[:projects] ||= 'active'
    case params[:projects]
    when 'active'
      current_tenant.projects.active.limit(5)
    when 'starred'
      current_user.starred_projects.active.limit(5)
    when 'new'
      current_tenant.projects.active.newly_created.limit(5)
    end
  end

  def tasks
    params[:tasks] ||= 'today'
    case params[:tasks]
    when 'today'
      current_tenant.tasks.due_before(Time.zone.tomorrow.beginning_of_day).limit(5)
    when 'new'
      current_tenant.tasks.newly_created.limit(5)
    end
  end

  def contacts
    params[:contacts] ||= 'starred'
    case params[:contacts]
    when 'starred'
      current_user.starred_contacts.limit(5)
    when 'new'
      current_tenant.contacts.newly_created.limit(5)
    end
  end

  def companies
    params[:companies] ||= 'starred'
    case params[:companies]
    when 'starred'
      current_user.starred_companies.limit(5)
    when 'new'
      current_tenant.companies.newly_created.limit(5)
    end
  end

  def sidebar
    :dashboard
  end
end
