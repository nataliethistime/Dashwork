module Starrable
  extend ActiveSupport::Concern

  included do
    has_many :stars, as: :starrable
  end

  def starred_by?(user)
    stars.exists?(user: user)
  end

  def toggle_star_for(user)
    star = stars.where(user: user).first

    if star.present?
      star.delete
    else
      stars.create!(user: user)
    end
  end
end
