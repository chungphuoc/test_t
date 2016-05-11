class StudioStationService

  def initialize(studio)
    @studio = studio
  end

  def update_stations(station_ids)
    destroyed_stations = @studio.stations.where.not(id: station_ids)
    new_stations = Station.where(id: (station_ids - @studio.stations.pluck(:id)))
    @studio.stations.destroy(destroyed_stations)
    new_stations.each { |station| @studio.stations << station }
  end

end