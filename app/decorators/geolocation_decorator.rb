class GeolocationDecorator < DecoratorBase
  def coordinates(geo)
    return "" unless geo.has_coordinates?
    "#{geo.decorate(:rounded_latitude)}, #{geo.decorate(:rounded_longitude)}"
  end

  def map(geo)
    return "" unless geo.has_coordinates?
    render MapComponent.new query: "#{geo.latitude},#{geo.longitude}"
  end

  def rounded_latitude(geo)
    geo.latitude.to_f.round 4
  end

  def rounded_longitude(geo)
    geo.longitude.to_f.round 4
  end
end
