class Manage::StationsController < Manage::BaseController
  def index
    @stations = @studio.stations
  end

  def update
    station_listing = StationListing.new(station_listing_params)
    station_listing.save
    flash[:success] = 'Station listing has been successfully updated.'
    redirect_to manage_stations_path
  end

  private
    def station_listing_params
      { studio: @studio, station_ids: params[:station_ids] || [] }
    end
end
