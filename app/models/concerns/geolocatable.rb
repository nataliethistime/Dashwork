module Geolocatable
  extend ActiveSupport::Concern

  included do
    has_one :geolocation, as: :geolocatable
    accepts_nested_attributes_for :geolocation

    before_validation do |item|
      #
      # TODO: there might be a better way to do this. Idea is to only save valid geolocations
      # however partial valus get thrown out without any kind of error logging
      #
      item.geolocation = nil unless item.geolocation.present? && item.geolocation.valid?
    end
  end
end
