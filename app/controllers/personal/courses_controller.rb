class Personal::CoursesController < Personal::BaseController
  # layout false, only: ['personal']
  layout 'personal_no_panel'

  def index
    @courses = Course.where(status: Course.statuses[:active]).page(params[:page])
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
    @courses = CoursesSearchService.new(params).execute.page(params[:page])
    @courses = @courses.collect do |course|
      {
        id: course.id,
        title: course.name,
        url: "http://www.example.com/",#personal_course_url(course),
        class: 'event-important',
        start: DateTime.now.to_f#(course.start_date.to_datetime + course.start_time.seconds_since_midnight.seconds).to_f * 1000
      }
    end
    @result = {success: '1', result: @courses}
    render :search_result, layout: 'personal_background'
  end
end
