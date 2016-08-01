class Admin::CourseCategoriesController < Admin::BaseController
  def add
    @course_category = CourseCategory.create(course_category_params)
  end

  def remove
    @course_category = CourseCategory.find_by(course_category_params)
    @course_category.destroy if @course_category
  end

  def destroy
    @course_category = CourseCategory.find(params[:id])
    if @course_category
      @course_category.destroy
      set_flash_message :success, :destroyed
    else
      set_flash_message :errors, :delete
    end
    redirect_to admin_category_path(params[:category_id])
  end

  private

  def course_category_params
    params.permit(:course_id, :category_id)
  end
end
