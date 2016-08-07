class Personal::FavouriteStudiosController < Personal::BaseController
	before_action :require_permission!, only: :remove
  before_action :prepare_favourite_studio, only: :remove
  before_action :prepare_more_favourite_studios, only: :remove_more

  def add
    @studio_id = params[:studio_id]
    current_user.favourite_studios.create(studio_id: params[:studio_id])
  end

  def remove
    return unless @favourite_studio
    @studio_id = params[:studio_id]
    @favourite_studio.destroy
  end

  def remove_more
    return unless @favourite_studios
    @studio_ids = params[:studio_ids]
    @favourite_studios.destroy_all
  end

  private

  def require_permission!
    return redirect_to :back if current_user.role_id != params[:customer_id].to_i
  end

  def prepare_favourite_studio
    @favourite_studio = FavouriteStudio.find_by_customer_id_and_studio_id(params[:customer_id],
                                                                             params[:studio_id])
  end

  def prepare_more_favourite_studios
    @favourite_studios = FavouriteStudio.where(customer_id: current_user.role_id,
                                               studio_id: params[:studio_ids])
  end
end
