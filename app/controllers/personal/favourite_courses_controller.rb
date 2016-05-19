class Personal::FavouriteCoursesController < Personal::BaseController
  before_action :require_permission!, only: :remove
  before_action :prepare_favourite_course, only: :remove

  def index
    @courses = CoursesQuery.new(current_user).favourite_courses
                           .page params[:page]
  end

  def add
    @course_id = params[:course_id]
    current_user.favourite_courses.create(course_id: params[:course_id])
  end

  def remove
    return unless @favourite_course
    @course_id = params[:course_id]
    @favourite_course.destroy
  end

  private

  def require_permission!
    return redirect_to :back if current_user.role_id != params[:customer_id].to_i
  end

  def prepare_favourite_course
    @favourite_course = FavouriteCourse.find_by_customer_id_and_course_id(params[:customer_id], params[:course_id])
  end
end
