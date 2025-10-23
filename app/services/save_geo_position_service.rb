class SaveGeoPositionService
  def initialize(latitude:, longitude:)
    # @locatable = locatable
    @latitude = latitude.to_f
    @longitude = longitude.to_f
  end

  def call
    geo_position = @locatable.geo_position || @locatable.build_geo_position

    geo_position.latitude = @latitude
    geo_position.longitude = @longitude

    geo_position.save ? geo_position : nil
  end
end