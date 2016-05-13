class Personal::FavouriteClassesController < Personal::BaseController
  before_action :require_permission!, only: :delete_favourite

  def create_favourite
    @course_id = params[:course_id]
    current_user.favourite_classes.create(course_id: params[:course_id])
  end

  def delete_favourite
    if @favourite_class
      @course_id = params[:course_id]
      @favourite_class.destroy
    end
  end

  private
  def require_permission!
    prepare_favourite_class
    if current_user.role_id != params[:customer_id].to_i
      redirect_to :back
    end
  end

  def prepare_favourite_class
    @favourite_class = FavouriteClass.find_by_customer_id_and_course_id(params[:customer_id], params[:course_id])
  end
end
