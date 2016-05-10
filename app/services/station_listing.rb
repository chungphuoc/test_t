class StationListing
  include ActiveModel::Model

  attr_accessor :studio, :station_ids

  def initialize(params = {})
    super(params)
  end

  def save
    destroyed_stations = @studio.stations.where.not(id: @station_ids)
    new_stations = Station.where(id: (@station_ids - @studio.stations.pluck(:id)))
    @studio.stations.destroy(destroyed_stations)
    new_stations.each { |station| @studio.stations << station }
  end

end