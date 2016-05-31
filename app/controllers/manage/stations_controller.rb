class Manage::StationsController < Manage::BaseController
  before_action :prepare_requested_station, only: [:edit, :update, :destroy]

  def index
    @station_ids = @studio.stations.pluck(:id)
  end

  def update
    StudioStationService.new(@studio).update_stations(params[:station_ids].to_a)
    flash[:success] = 'Station listing has been successfully updated.'
    redirect_to manage_stations_path
  end

  def new
    @station = Station.new
  end

  def create
    @station = @studio.requested_stations.new(station_params)
    if @station.save
      flash[:success] = 'Your station request has been successfully sent.'
      redirect_to manage_stations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @station.update_attributes(station_params)
      flash[:success] = 'Your station request has been successfully updated.'
      redirect_to manage_stations_path
    else
      render :edit
    end
  end

  def destroy
    @station.destroy
    flash[:success] = 'Your station request has been successfully deleted.'
    redirect_to manage_stations_path
  end

  private

  def prepare_requested_station
    @station = @studio.requested_stations.requested.find_by_id(params[:id])
    redirect_to manage_stations_path, notice: 'Permission denied' unless @station
  end

  def station_params
    params.require(:station).permit(:name, :location, :latitude, :longitude).merge(status: :requested)
  end
end
