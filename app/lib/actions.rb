module Actions
  extend self

  def actions_for(model, actions)
    actions
      .map { |action| Actions.public_send("#{action}_action", model) }
      .join ''
  end

  def edit_action(model)
    helpers.link_to routes.polymorphic_path([:edit, model]), class: 'navbar-item' do
      helpers.icon_for :edit
    end
  end

  def delete_action(model)
    helpers.link_to routes.polymorphic_path([model]),
      method: :delete,
      data: { confirm: "Are you sure you want to delete #{model.decorate :name}?" },
      class: 'navbar-item' do
      helpers.icon_for :delete
    end
  end

  private

  def action_item(icon, path)
  end

  def helpers
    ApplicationController.helpers
  end

  def routes
    Rails.application.routes.url_helpers
  end
end