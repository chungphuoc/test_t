class Manage::StationsController < Manage::BaseController
  before_action :prepare_station, only: [:show, :edit, :update, :destroy]

  def index
    @stations = @studio.stations
  end

  def show
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      @studio.stations << @station
      flash[:success] = 'Station has been successfully created'
      redirect_to manage_station_path(@station)
    else
      flash.now[:error] = @station.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @station.assign_attributes(station_params)
    if @station.save
      flash[:success] = 'Station has been successfully updated'
      redirect_to manage_station_path(@station)
    else
      flash.now[:error] = @station.errors.full_messages
      render :edit
    end
  end

  def destroy
    @station.destroy
    redirect_to manage_stations_url
  end

  private
    def prepare_station
      @station = Station.find(params[:id])
    end

    def station_params
      params.require(:station).permit(:name, :location)
    end
end
