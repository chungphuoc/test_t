class Personal::CoursesController < Personal::BaseController
  def index
    @courses = Course.paginate(page: params[:page], per_page: 9)
  end

  def show
    @course = Course.find(params[:id])
  end
end
