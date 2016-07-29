class StaticPagesController < ApplicationController
  def home
    @courses = Course.where(status: Course.statuses[:active]).limit(3)
    @image = BackgroundImage.get_image_homepage
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
