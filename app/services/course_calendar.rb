class CourseCalendar
  include ActionView::Helpers::NumberHelper
  def initialize(courses, path)
    @courses = courses
    @path = path
  end

  def result
    events_class = %w(event-info event-special)
    @courses = @courses.collect do |course|
      start_dates = []
      if course.repeatable
        start_dates = join_dates(course.start_date, course.days_of_week)
        start_dates = start_dates.map do |start_date|
          convert_time(start_date, course.start_time)
        end
      end
      start_dates.push(convert_time(course.start_date, course.start_time))

      title = template_course(course)
      start_dates.collect do |start_date|
        {
          id: course.id,
          title: title,
          tmpls_day: template_day(course),
          tmpls_week: title,
          name: course.name,
          url: @path.call(course),
          class: events_class.sample,
          start: start_date,
          end: start_date.to_i + 2.hours.in_milliseconds
        }
      end
    end
    @courses = @courses.flatten
  end

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

  def template_course(course)
    "<div class='course-calendar'>" \
    "<img src='#{course.cover_img}'>" \
    "<div class='info-course'>" \
    "<b>#{course.name}</b>" \
    "<br><i>#{Course.human_attribute_name('teacher')}: #{course.teacher_name}</i>" \
    "<br><i>#{Course.human_attribute_name('studio')}: #{course.studio_name}</i>" \
    "<br><i>#{Course.human_attribute_name('station')}: #{course.station_name}</i>" \
    "<br><i>#{Course.human_attribute_name('tuition')}: #{number_with_delimiter(course.tuition)} #{course.currency}</i>" \
    '</div></div>'.html_safe
  end

  def template_day(course)
    "<div class='course-calendar-day'>" \
    "<img src='#{course.cover_img}'>" \
    "<div class='info-course'>" \
    "<div class='course-title'>" \
    "<b>#{course.name}</b>" \
    '</div>' \
    "<div class='row'>" \
    "<div class='col-xs-6'>" \
    "<p>#{course.studio_name}</p>" \
    "<p>#{course.teacher_name}</p>" \
    "<p>#{course.station_name}</p>" \
    '</div>' \
    "<div class='col-xs-6'>" \
    "<p>#{course.kcal} kcal</p>" \
    "<p>#{course.tuition} usd</p>" \
    '</div>' \
    '</div>' \
    '</div></div>'.html_safe
  end
end