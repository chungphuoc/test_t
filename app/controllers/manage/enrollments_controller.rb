class Manage::EnrollmentsController < Manage::BaseController
  def index
    @enrollments = current_user.enrollments
                               .includes(:course, :customer)
                               .page(params[:page])
    @has_slidebar = false
  end

  def booked
    @enrollments = current_user.enrollments.where(status: Enrollment.statuses[:paid]).page(params[:page])
    render 'enrollment_table', layout: false
  end

  def passed
    @enrollments = current_user.enrollments.where(status: Enrollment.statuses[:passed]).page(params[:page])
    render 'enrollment_table', layout: false
  end

  def change_course
    @course = Course.find(params[:course_id])
    @time_options = if @course
                      @course.slot_time
                    else
                      @time_options = []
                    end
  end

  def by_join_date
    if params[:course_id] && params[:join_date] && params[:status]
      @enrollments = current_user.enrollments
                                 .where(join_date: params[:join_date],
                                        course_id: params[:course_id],
                                        status: Enrollment.statuses[params[:status]]).page(params[:page])
    else
      @enrollments = []
    end
    render 'enrollment_table', layout: false
  end
end
