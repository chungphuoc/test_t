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
    render :index, layout: 'personal_background'
  end
end
