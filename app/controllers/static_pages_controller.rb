class StaticPagesController < ApplicationController
  def home
    @courses = Course.page params[:page]
  end

  def feedback
    FeedbackMailer.to_admin(params[:name], params[:title], params[:message]).deliver_later
    flash[:notice] = "Your feedback has been sent."
    redirect_to :back
  end
end
