class Manage::EnrollmentsController < Manage::BaseController
  def index
    @enrollments = current_user.enrollments.page(params[:page])
  end

  def booked
    @enrollments = current_user.enrollments.where(status: Enrollment.statuses[:paid]).page(params[:page])
    render 'enrollment_table', layout: false
  end

  def passed
    @enrollments = current_user.enrollments.where(status: Enrollment.statuses[:passed]).page(params[:page])
    render 'enrollment_table', layout: false
  end
end
