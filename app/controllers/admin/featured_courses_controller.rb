class Admin::FeaturedCoursesController < Admin::BaseController
  def add
    @course = Course.find(params[:course_id])
    if @course
      FeaturedCourse.create(course_id: params[:course_id])
    else
      redirect_to admin_courses_path
    end
  end

  def remove
    @featured_course = FeaturedCourse.find_by(course_id: params[:course_id])
    @course = Course.find(params[:course_id])
    if @featured_course
      @featured_course.destroy
    else
      redirect_to admin_courses_path
    end
  end
end
