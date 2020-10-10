require_dependency 'personal_log'
require_dependency 'reviews'
require_dependency 'wiki'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.decorate_with(decorator)
    include MiniDecorator.new(decorator.new)
  end

  def self.routes
    Rails.application.routes.url_helpers
  end
end
