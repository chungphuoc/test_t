class StaticController < ApplicationController
  def home
    @courses = Course.page params[:page]
  end

  def feedback
  end
end
