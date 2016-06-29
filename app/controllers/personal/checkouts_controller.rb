class Personal::CheckoutsController < ApplicationController
  def process_payment
    @enrollment = current_user.enrollments.new(course_id: params[:course_id],
                                               join_date: params[:join_date])
    @payment_service = PaymentService.new(current_user)
    if @enrollment.save
      @payment_service.save_payment_info(params)
      @payment_service.update_customer_info(params)
      flash[:success] = t('personal.checkouts.checkout_success')
      redirect_to confirmation_personal_enrollments_path(course_id: params[:course_id])
    else
      flash[:error] = @enrollment.errors.full_messages[0]
      redirect_to :back
    end
  end
end
