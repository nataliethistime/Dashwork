# == Schema Information
#
# Table name: geolocations
#
#  id                :integer          not null, primary key
#  geolocatable_type :string
#  latitude          :string
#  longitude         :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  geolocatable_id   :bigint
#

class Geolocation < ApplicationRecord
  belongs_to :geolocatable, polymorphic: true

  validates :longitude, presence: true
  validates :latitude, presence: true

  #
  # TODO: fix up coords. Should they be stored as numbers? Better validation?
  # Are there min/max values we can check against?
  #

  def coordinates
    "#{latitude},#{longitude}"
  end
end
