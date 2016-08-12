class Personal::StudiosController < Personal::BaseController
  layout 'personal_no_panel', only: [:show]

  def index
    @studios = User.where(role_type: 'Studio')
    render layout: 'personal_no_panel'
  end

  def show
    @studio = Studio.find(params[:id])
  end

  def by_name
    @studios = User.where(role_type: 'Studio')
    I18n.locale = params[:locale]||I18n.locale
    render 'studio_by_name', layout: false
  end

  def by_station
    I18n.locale = params[:locale]||I18n.locale
    @stations = Station.all.includes(:studios, :translations)
    render 'studio_by_station', layout: false
  end

  def by_favorite
    I18n.locale = params[:locale]||I18n.locale
    @favorite = current_user.studios_favourites.includes(:user)
    render 'studio_by_favorite', layout: false
  end
end
