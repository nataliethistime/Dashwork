class GroupsController < ApplicationController
  before_action :set_domain

  def index
    @groups = tenant_groups.all
  end

  def show
    @group = tenant_groups.find params[:id]
    @items = @group.public_send(@domain_plural).includes(:groups).page params[:page]
  end

  def new
    @group = tenant_groups.new
  end

  def create
    @group = tenant_groups.new group_params
    if @group.save
      redirect_to polymorphic_path([@domain, :groups]), notice: 'Successfully created group'
    else
      render 'new'
    end
  end

  def edit
    @group = tenant_groups.find params[:id]
  end

  def update
    @group = tenant_groups.find params[:id]
    if @group.update group_params
      redirect_to polymorphic_path([@group]), notice: 'Successfully updated group'
    else
      render 'edit'
    end
  end

  def destroy
    @group = tenant_groups.find params[:id]
    @group.delete
    redirect_to polymorphic_path([@domain, :groups]), notice: 'Successfully deleted group'
  end

  private

  def group_params
    params.require(:"#{@domain}_group").permit(:name)
  end

  #
  # Takes into account the domain and returns the association for the correct kind of field
  #
  def tenant_groups
    current_tenant.public_send "#{@domain}_groups"
  end

  def set_domain
    @domain = params[:domain]
    raise 'Domain must be specified when using he groups controller' if @domain.blank?
    @domain_plural = @domain.pluralize(2)
    @display_as = params[:display_as] || 'group'
    @display_as_plural = @display_as.pluralize(2)
  end
end
