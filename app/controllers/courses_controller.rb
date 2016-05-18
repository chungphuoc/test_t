class CoursesController < ApplicationController
  paginates_per 12
  def index
    @courses = Course.page params[:page]
  end

  def show
    @course = Course.find(params[:id])
  end
end
