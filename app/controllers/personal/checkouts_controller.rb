class Personal::CheckoutsController < ApplicationController
  def process_payment
    @enrollment = current_user.enrollments.new(course_id: params[:course_id],
                                               join_date: params[:join_date])
    @payment_service = PaymentService.new(current_user)
    if @enrollment.save
      @payment_service.save_payment_info(params)
      @payment_service.update_customer_info(params)
      flash[:notice] = 'Book class successful!'
      redirect_to :back
    else
      flash[:notice] = 'Cannot book this class!'
      redirect_to :back
    end
  end
end
