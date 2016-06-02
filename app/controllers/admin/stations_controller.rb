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
      flash[:success] = 'Create Station successful!'
      redirect_to admin_stations_path
    else
      flash[:error] = 'Can not create Station'
      render :new
    end
  end

  def update
    if @station.update_attributes(station_params)
      flash[:success] = 'Update Station successful!'
      redirect_to admin_stations_path
    else
      flash[:error] = 'Can not update Station'
      render :edit
    end
  end

  def destroy
    if @station.destroy
      flash[:success] = 'Create Station successful!'
    else
      flash[:error] = 'Can not create Station'
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
