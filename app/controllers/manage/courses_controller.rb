class Manage::CoursesController < Manage::BaseController
  before_action :prepare_course, only: [:show, :edit, :update, :destroy, :close, :reopen]

  def index
    respond_to do |format|
      course_query = CoursesQuery.new(current_user)
      @courses = current_user.courses.includes(:teacher, 
                                               :course_type, 
                                               station: [:translations], 
                                               studio: [:user])
      @courses = CourseCalendar.new(@courses, lambda { |x| manage_course_path(x) }).result
      @result = { success: '1', result: @courses }.to_json
      @has_slidebar = false
      format.html { render :index, layout: 'studio' }
      format.json { render json: @result }
    end
  end

  def new
    @has_slidebar = false;
    @course = @studio.courses.new
  end

  def create
    @course = @studio.courses.new(course_params)
    if @course.save
      set_flash_message :success, :created
      redirect_to manage_course_path(@course)
    else
      set_flash_message :error, :error, now: true, scope: :error
      render :new
    end
  end

  def show
    @has_slidebar = false
  end

  def edit
  end

  def update
    @course.assign_attributes(course_params)
    # @course.days_of_week = params[:days_of_week]||[]
    if @course.save
      set_flash_message :success, :updated
      redirect_to manage_course_path(@course)
    else
      set_flash_message :error, :error, now: true, scope: :error
      render :edit
    end
  end

  def destroy
    @course.destroy
    set_flash_message :success, :destroyed
    redirect_to all_manage_courses_url
  end

  def close
    @course.inactive!
    set_flash_message :success, :closed
    redirect_to manage_courses_url
  end

  def reopen
    @course.active!
    set_flash_message :success, :reopened
    redirect_to manage_courses_url
  end

  def booked
    @booked_courses = @studio.courses.booked
  end

  def past
    @past_courses = @studio.courses.past
  end

  def all
    @course_types = @studio.course_types.includes(:courses)
                                        .page(params[:page])
                                        .per(5)
  end

  private

  def convert_time(start_date, start_time)
    dt = DateTime.new(
      start_date.year,
      start_date.month,
      start_date.day,
      start_time.hour,
      start_time.min,
      start_time.sec
    )
    dt.strftime('%Q')
  end

  def join_dates(start_date, days)
    days = days + days.collect{|d| d + 7}
    newdays = days.collect do |day|
      newday = start_date.beginning_of_week + (day - 1).days
      if start_date.wday <= day
        newday
      end
    end
    newdays.compact
  end

  def prepare_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:course_type_id, :cover_img, :phone_number, :website,
                                   :description, :rating, :kcal, :num_slot,
                                   :tuition, :start_time, :end_time, :start_date,
                                   :teacher_id, :station_id, :exercise_id,
                                   :repeatable, :days_of_week => [])
  end
end
