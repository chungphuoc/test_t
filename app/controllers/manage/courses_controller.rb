class Manage::CoursesController < Manage::BaseController
  before_action :prepare_course, only: [:show, :edit, :update, :destroy, :close, :reopen]

  def index
    respond_to do |format|
      course_query = CoursesQuery.new(current_user)
      @courses = current_user.courses
      @course_date_data = course_query.join_dates_json
      if params[:start_date]
        start_date = begin
                       Date.strptime(params[:start_date], '%d-%m-%Y')
                     rescue ArgumentError
                       nil
                     end
        @courses = course_query.courses_by_date(start_date) if start_date
      end
    events_class = %w(event-warning event-important event-info event-special)
    @courses = @courses.collect do |course|
        start_date = convert_time(course.start_date, course.start_time)
        title = template_course(course)
        {
          id: course.id,
          title: title,
          tmpls_day: template_day(course),
          name: course.name,
          url: manage_course_path(course),
          class: events_class.sample,
          start: start_date,
          end: start_date.to_i + 2.hours.in_milliseconds
        }
      end
      @result = { success: '1', result: @courses }.to_json
      format.html { render :index, layout: 'personal_background' }
      format.json { render json: @result }
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

  def template_course(course)
      "<div class='course-calendar'>" +
      "<img src='#{course.cover_img}'>" +
      "<div class='info-course'>" +
      "<b>#{course.name}</b>" +
      "<br><i>Teacher: #{course.teacher.name}</i>" +
      "<br><i>Studio: #{course.studio.name}</i>" +
      "<br><i>Station: #{course.station.name}</i>" +
      "<br><i>Tuition: #{course.tuition} #{course.currency}</i>" +
      "</div></div>".html_safe
  end

  def template_day(course)
    "<div class='course-calendar-day'>" \
    "<img src='#{course.cover_img}'>" \
    "<div class='info-course'>" \
    "<div class='course-title'>" \
    "<b>#{course.name}</b>" \
    "</div>" \
    "<div class='row'>" \
    "<div class='col-xs-6'>" \
    "<p>#{course.studio.name}</p>" \
    "<p>#{course.teacher.name}</p>" \
    "<p>#{course.station.name}</p>" \
    "</div>" \
    "<div class='col-xs-6'>" \
    "<p>#{course.kcal} kcal</p>" \
    "<p>#{course.tuition} usd</p>" \
    "</div>" \
    "</div>" \
    "</div></div>".html_safe
  end
end
