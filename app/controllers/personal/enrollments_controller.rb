class Personal::EnrollmentsController < Personal::BaseController
  def index
    @enrollments = EnrollmentsQuery.new(current_user).by_statuses(params[:statuses] || [])
                                   .page params[:page]
  end

  def classes
    @enrollments = EnrollmentsQuery.new(current_user).by_statuses(params[:statuses] || [])
                               .page params[:page]
    render 'classes', layout: false
  end

  def create
    @enrollment = current_user.enrollments.new(course_id: params[:course_id])
    if @enrollment.save
      set_flash_message :success, :created
      redirect_to personal_enrollments_path
    else
      flash[:error] = @enrollment.errors.full_messages[0]
      redirect_to personal_enrollments_path
    end
  end

  def cancel
    @enrollment = Enrollment.find_by(id: params[:enrollment_id])
    if @enrollment && @enrollment.can_cancel?
      @enrollment.update_attributes(status: :cancel)
      @enrollment.cancel_class_mailer
    end
    render nothing: true
  end

  def calories_burnt
    calories_burnt = EnrollmentsQuery.new(current_user).calories_burnt(params[:frequency])
    render text: calories_burnt.to_s
  end

  def confirmation
    if params[:course_id]
      @course = Course.find(params[:course_id])
      @enrollment = current_user.enrollments.last
    else
      flash[:error] = 'Please choose one course!'
      redirect_to personal_courses
    end
  end
end
