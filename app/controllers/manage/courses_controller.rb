class Manage::CoursesController < Manage::BaseController
  before_action :prepare_course, only: [:show, :edit, :update, :destroy, :close, :reopen]

  def index
    course_query = CoursesQuery.new(current_user)
    # @courses = @studio.courses.order(start_date: :asc)
    # @course_date_data = @courses.group(:start_date).count.to_json
    @courses = current_user.courses
    @course_date_data = course_query.join_dates_json
    if params[:start_date]
      start_date = begin
                     Date.strptime(params[:start_date], '%d-%m-%Y')
                   rescue ArgumentError
                     nil
                   end
      # @courses = @courses.where(start_date: start_date) if start_date
      @courses = course_query.courses_by_date(start_date) if start_date
    end
  end

  def new
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
  end

  def edit
  end

  def update
    @course.assign_attributes(course_params)
    #@course.days_of_week = params[:days_of_week]||[]
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
    redirect_to manage_courses_url
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

  private

  def prepare_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :cover_img, :phone_number, :website,
                                   :description, :rating, :kcal, :num_slot,
                                   :tuition, :start_time, :end_time, :start_date,
                                   :teacher_id, :station_id, :exercise_id,
                                   :days_of_week => [])
  end
end
