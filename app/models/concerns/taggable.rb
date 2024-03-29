module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :tag_assignments, as: :taggable
    has_many :tags, through: :tag_assignments
  end
end
