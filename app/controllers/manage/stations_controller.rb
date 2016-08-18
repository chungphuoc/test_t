class Manage::StationsController < Manage::BaseController
  before_action :prepare_requested_station, only: [:edit, :update, :destroy]

  def index
    @station_ids = @studio.stations.pluck(:id)
  end

  def update_listing
    StudioStationService.new(@studio).update_stations(params[:station_ids].to_a)
    set_flash_message :success, :updated_listing
    redirect_to manage_stations_path
  end

  def new
    @station = Station.new
    @station.translations.build locale: :en
    @station.translations.build locale: :ja
  end

  def create
    @station = @studio.requested_stations.new(station_params)
    if @station.save
      set_flash_message :success, :created
      redirect_to manage_stations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @station.update_attributes(station_params)
      set_flash_message :success, :updated
      redirect_to manage_stations_path
    else
      render :edit
    end
  end

  def destroy
    @station.destroy
    set_flash_message :success, :destroyed
    redirect_to manage_stations_path
  end

  private

  def prepare_requested_station
    @station = @studio.requested_stations.requested.find_by_id(params[:id])
    return if @station
    set_flash_message :notice, :access_denied, scope: :error
    redirect_to manage_stations_path
  end

  def station_params
    params.require(:station).permit(
      :name,
      :location,
      :latitude,
      :longitude,
      translations_attributes: [:id, :locale, :name]
    ).merge(status: :requested)
  end
end
