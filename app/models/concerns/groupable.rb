module Groupable
  extend ActiveSupport::Concern

  included do
    has_many :group_memberships, as: :groupable
    has_many :groups, through: :group_memberships
  end
end
