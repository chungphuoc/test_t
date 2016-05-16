class Personal::FavouriteCoursesController < Personal::BaseController
  before_action :require_permission!, only: :delete_favourite

  def create_favourite
    @course_id = params[:course_id]
    current_user.favourite_courses.create(course_id: params[:course_id])
  end

  def delete_favourite
    if @favourite_course
      @course_id = params[:course_id]
      @favourite_course.destroy
    end
  end

  private
  def require_permission!
    if current_user.role_id != params[:customer_id].to_i
      redirect_to :back
      return
    end
    prepare_favourite_course
  end

  def prepare_favourite_course
    @favourite_course = FavouriteCourse.find_by_customer_id_and_course_id(params[:customer_id], params[:course_id])
  end
end
