module Actions
  extend self

  def actions_for(model, actions)
    actions
      .map { |action| Actions.public_send("#{action}_action", model) }
      .join ''
  end

  def edit_action(model)
    puts 'Deprecated: magic edit action, use the view component instead'
    helpers.link_to routes.polymorphic_path([:edit, model]), class: 'navbar-item' do
      helpers.icon_for :edit
    end
  end

  def delete_action(model)
    puts 'Deprecated: magic delete action, use the view component instead'
    helpers.link_to routes.polymorphic_path([model]),
      method: :delete,
      data: { confirm: "Are you sure you want to delete #{model.decorate :name}?" },
      class: 'navbar-item' do
      helpers.icon_for :delete
    end
  end

  def create_action(model)
    puts 'Deprecated: magic create action, use the view component instead'
    helpers.link_to routes.polymorphic_path([:new, model.model_name.singular.to_sym]), class: 'navbar-item' do
      helpers.icon_for :create
    end
  end

  private

  def helpers
    ApplicationController.helpers
  end

  def routes
    Rails.application.routes.url_helpers
  end
end
