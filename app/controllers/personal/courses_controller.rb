class Personal::CoursesController < Personal::BaseController
  def index
    @courses = Course.page(params[:page])
  end

  def show
    @course = Course.find(params[:id])
  end

  def search
    @courses = CoursesSearchService.new(params).execute.page(params[:page])
    render :index
  end
end
