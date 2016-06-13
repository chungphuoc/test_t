class StaticPagesController < ApplicationController
  def home
    @courses = Course.page params[:page]
  end

  def feedback
    FeedbackMailer.to_admin(params[:name], params[:title], params[:message]).deliver_later
    set_flash_message :success, :feedback
    redirect_to :back
  end

  def contact_us
    
  end
end
