class Admin::StationsController < Admin::BaseController
  before_action :prepare_station, only: [:show, :edit, :update, :destroy]

  def index
    @stations = Station.all
  end

  def show
  end

  def new
    @station = Station.new
  end

  def edit
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      set_flash_message :success, :created
      redirect_to admin_stations_path
    else
      set_flash_message :error, :error, now: true, scope: :error
      render :new
    end
  end

  def update
    if @station.update_attributes(station_params)
      set_flash_message :success, :updated
      redirect_to admin_stations_path
    else
      set_flash_message :error, :error, now: true, scope: :error
      render :edit
    end
  end

  def destroy
    if @station.destroy
      set_flash_message :success, :destroyed
    else
      set_flash_message :error, :error, now: true, scope: :error
    end
    redirect_to :back
  end

  private

  def prepare_station
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:name, :location, :longitude, :latitude, :status)
  end
end
