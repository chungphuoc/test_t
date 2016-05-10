class Personal::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_customer!

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def authenticate_customer!
    unless current_user.role_type == 'Customer'
      flash[:notice] = "Access Denied"
      redirect_to root_path
    end
  end
end
