class Personal::StudiosController < Personal::BaseController
  def index
  end

  def show
    @studio = Studio.find(params[:id])
  end

  def by_name
    render 'studio_by_name', layout: false
  end

  def by_station
    @stations = Station.all
    render 'studio_by_station', layout: false
  end
end
