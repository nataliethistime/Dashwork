class LinkedItemsPanelComponent < ViewComponent::Base
  def initialize(parent, scope, display_attribute: nil)
    @parent = parent
    @scope = scope.to_s
    @items = parent.public_send @scope
    @singular = @scope.singularize
    @display_attribute = display_attribute.presence || :name
  end

  def name_for(item)
    item.decorate(@display_attribute)
  end

  def view_all_path
    polymorphic_path([@parent, @scope])
  end

  def create_path
    polymorphic_path([:new, @singular], { "#{@parent.model_name.to_s.downcase}_id": @parent.id })
  end
end
