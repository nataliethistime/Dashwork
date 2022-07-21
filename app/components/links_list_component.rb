class LinksListComponent < ViewComponent::Base
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def company?
    @item.respond_to?(:company) && @item.company.present?
  end

  def contact?
    @item.respond_to?(:contact) && @item.contact.present?
  end

  def project?
    @item.respond_to?(:project) && @item.project.present?
  end

  def tags?
    @item.respond_to?(:tags) && @item.tags.any?
  end
end
