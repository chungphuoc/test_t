class Personal::CoursesController < Personal::BaseController
  include ActionView::Helpers::NumberHelper
  # layout false, only: ['personal']
  layout 'personal_no_panel'

  def index
    @courses = find_courses_by_category('featured', 3)
    render layout: 'personal_background'
  end

  def show
    @course = Course.find(params[:id])
    if @course.inactive?
      flash[:notice] = 'This class is not open.'
      redirect_to :back
    end
  end

  def search
    respond_to do |format|
      @favourite_studios = current_user.favourite_studios.includes(:studio)
      @courses = CoursesSearchService.new(params).execute.page(params[:page]).per(100)
      @courses = CourseCalendar.new(@courses, ->(x) { personal_course_path(x) }).result
      @result = { success: '1', result: @courses }.to_json
      format.html { render :search_result, layout: 'personal_background' }
      format.json { render json: @result }
    end
  end

  def featured_courses
    @courses = find_courses_by_category('featured', 3)
    render 'course_recommend', layout: false
  end

  def event_courses
    @courses = find_courses_by_category('event', 3)
    render 'course_recommend', layout: false
  end

  def new_courses
    @courses = find_courses_by_category('new', 3)
    render 'course_recommend', layout: false
  end

  private

  def find_courses_by_category(category_name, limit = 3)
    courses = Course.find_course_by_category(category_name)
    if courses.nil?
      []
    else
      courses.where(status: Course.statuses[:active]).limit(limit)
    end
  end
end
