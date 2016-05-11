class Personal::CoursesController < Personal::BaseController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

end
