class StarButtonComponent < ViewComponent::Base
  def initialize(starrable)
    @starrable = starrable
  end

  def star_path
    toggle_star_path(type: @starrable.model_name.singular, id: @starrable.id)
  end

  def starred?
    @starrable.starred_by? helpers.current_user
  end
end
