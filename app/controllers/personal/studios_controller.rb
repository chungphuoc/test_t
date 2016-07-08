class Personal::StudiosController < Personal::BaseController
  layout 'personal_no_panel', only: [:show]
  def index
  end

  def show
    @studio = Studio.find(params[:id])
  end

  def by_name
    I18n.locale = params[:locale]||I18n.locale
    render 'studio_by_name', layout: false
  end

  def by_station
    I18n.locale = params[:locale]||I18n.locale
    @stations = Station.all
    render 'studio_by_station', layout: false
  end
end
