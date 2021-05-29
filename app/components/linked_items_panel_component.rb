class LinkedItemsPanelComponent < ViewComponent::Base
  def initialize(parent, items:, display_attribute: nil)
    @parent = parent
    @items = items
    @scope = items.model_name.plural.to_s
    @singular = @scope.singularize
    @display_attribute = display_attribute.presence || :name
  end

  def name_for(item)
    item.decorate(@display_attribute)
  end

  def view_all_path
    polymorphic_path([@parent, @scope.to_sym])
  end

  def create_path
    polymorphic_path([:new, @singular.to_sym], { "#{@parent.model_name.to_s.downcase}_id": @parent.id })
  end
end
