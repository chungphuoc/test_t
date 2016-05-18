class CoursesController < ApplicationController
  paginates_per 12
  def index
    #@courses = Course.paginate(page: params[:page], per_page: 12)
    @courses = Course.page params[:page]
  end

  def show
    @course = Course.find(params[:id])
  end
end
