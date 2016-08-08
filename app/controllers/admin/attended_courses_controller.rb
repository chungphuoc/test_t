class Admin::AttendedCoursesController < Admin::BaseController
  def index
    @enrollments = Enrollment.where(customer_id: params[:customer_id])
                             .includes(:options, course: [studio: [:user]])
                             .page(params[:page])
    @customer = Customer.find(params[:customer_id])
  end
end
