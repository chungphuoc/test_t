class StaticPagesController < ApplicationController
  def home
    @courses = Course.page params[:page]
  end

  def feedback
  end

  def about_us
  end
end
