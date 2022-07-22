class LinksListComponent < ViewComponent::Base
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def company?
    item.respond_to?(:company) && item.company.present?
  end

  def contact?
    item.respond_to?(:contact) && item.contact.present?
  end

  def project?
    item.respond_to?(:project) && item.project.present?
  end

  def tags?
    item.respond_to?(:tags) && item.tags.any?
  end

  def tasks?
    item.respond_to?(:tasks) && item.tasks.any?
  end

  def notes?
    item.respond_to?(:notes) && item.notes.any?
  end

  def contacts?
    item.respond_to?(:contacts) && item.contacts.any?
  end

  def projects?
    item.respond_to?(:projects) && item.projects.any?
  end

  def companies?
    item.respond_to?(:companies) && item.companies.any?
  end
end
