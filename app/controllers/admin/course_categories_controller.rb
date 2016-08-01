class Admin::CourseCategoriesController < Admin::BaseController
  def add
    # @course = Course.find(params[:course_id])
    @course_category = CourseCategory.create(course_category_params)
  end

  def remove
    # @course = Course.find(params[:course_id])
    @course_category = CourseCategory.find_by(course_category_params)
    if @course_category
      @course_category.destroy
    else
      redirect_to admin_courses_path
    end
  end

  private

  def course_category_params
    params.permit(:course_id, :category_id)
  end
end
