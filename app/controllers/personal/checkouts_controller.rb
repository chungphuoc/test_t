class Personal::CheckoutsController < ApplicationController
  def process_payment
    @enrollment = current_user.enrollments.new(course_id: params[:course_id],
                                               join_date: params[:join_date])
    @payment_service = PaymentService.new(current_user)
    if @enrollment.save
      @payment_service.save_payment_info(params)
      @payment_service.update_customer_info(params)
      flash[:notice] = 'Book class successful!'
    else
      flash[:notice] = @enrollment.errors.full_messages[0]
    end
    redirect_to :back
  end
end
