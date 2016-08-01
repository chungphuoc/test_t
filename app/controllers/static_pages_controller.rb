class StaticPagesController < ApplicationController
  def home
    @courses = Course.find_course_by_category('Featured Courses').limit(3)
  end

  def feedback
    FeedbackMailer.to_admin(params[:name], params[:email], params[:message]).deliver_later
    set_flash_message :success, :feedback
    redirect_to :back
  end

  def contact_us
  end

  def welcome
    render 'welcome'
  end

  def term_condition
    @term = Term.first
  end
end
