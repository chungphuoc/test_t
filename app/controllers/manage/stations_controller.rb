class Manage::StationsController < Manage::BaseController
  def index
    @station_ids = @studio.stations.pluck(:id)
  end

  def update
    StudioStationService.new(@studio).update_stations(params[:station_ids].to_a)
    flash[:success] = 'Station listing has been successfully updated.'
    redirect_to manage_stations_path
  end
end
