class StaticController < ApplicationController
  def home
    @courses = Course.paginate(page: params[:page], per_page: 9)
  end

  def feedback
  end
end
