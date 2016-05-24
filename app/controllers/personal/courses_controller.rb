class Personal::CoursesController < Personal::BaseController
  def index
    @courses = Course.page(params[:page])
  end

  def show
    @course = Course.find(params[:id])
  end

  def search
    @courses = Course.search(search_params).page(params[:page])
  end

  private

  def search_params
    params.slice(:station_ids, :exercise_ids)
  end
end
