class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.decorate_with(decorator)
    include MiniDecorator.new(decorator.new)
  end
end
