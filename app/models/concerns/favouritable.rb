module Favouritable
  extend ActiveSupport::Concern

  included do
    has_many :favourites, as: :favouritable
  end

  def favourited_by?(user)
    favourites.exists?(user: user)
  end

  def toggle_favourite_for(user)
    fav = favourites.where(user: user).first

    if fav.present?
      fav.delete
    else
      favourites.create!(user: user)
    end
  end
end
