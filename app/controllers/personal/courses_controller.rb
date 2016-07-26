class Personal::CoursesController < Personal::BaseController
  include ActionView::Helpers::NumberHelper
  # layout false, only: ['personal']
  layout 'personal_no_panel'

  def index
    @courses = Course.where(status: Course.statuses[:active]).limit(3)
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
      @favourite_courses = current_user.favourite_courses.includes(:course)
      @courses = CoursesSearchService.new(params).execute.page(params[:page])
      events_class = %w(event-warning event-important event-info event-special)
      @courses = @courses.collect do |course|
        start_date = convert_time(course.start_date, course.start_time)
        title = template_course(course)
        {
          id: course.id,
          title: title,
          tmpls_day: template_day(course),
          name: course.name,
          url: personal_course_path(course),
          class: events_class.sample,
          start: start_date,
          end: start_date.to_i + 2.hours.in_milliseconds
        }
      end
      @result = { success: '1', result: @courses }.to_json
      format.html { render :search_result, layout: 'personal_background' }
      format.json { render json: @result }
    end
  end

  def featured_courses
    @courses = Course.where(status: Course.statuses[:active]).limit(3)
    render 'course_recommend', layout: false
  end

  def event_courses
    @courses = Course.where(status: Course.statuses[:active]).limit(3)
    render 'course_recommend', layout: false
  end

  def new_courses
    @courses = Course.order('created_at DESC').limit(3)
    render 'course_recommend', layout: false
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

    def template_course(course)
      "<div class='course-calendar'>" +
      "<img src='#{course.cover_img}'>" +
      "<div class='info-course'>" +
      "<b>#{course.name}</b>" +
      "<br><i>Teacher: #{course.teacher.name}</i>" +
      "<br><i>Studio: #{course.studio.name}</i>" +
      "<br><i>Station: #{course.station.name}</i>" +
      "<br><i>Tuition: #{number_with_delimiter(course.tuition)} #{course.currency}</i>" +
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
