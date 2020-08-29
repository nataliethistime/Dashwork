class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_tenant
  before_action :set_sidebar

  def home
    @sidebar = :application

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

  def current_tenant
    current_user&.tenant
  end

  private

  #
  # Override this method to set the sidebar in your controllers. Alternitively you can set @sidebar
  # within individual actions when you need to.
  #
  def sidebar
    nil
  end

  def set_sidebar
    @sidebar = sidebar
  end

  def check_tenant
    if user_signed_in? && current_tenant.nil?
      redirect_to new_tenant_path unless helpers.current_page?(new_tenant_path)
    end
  end
end
