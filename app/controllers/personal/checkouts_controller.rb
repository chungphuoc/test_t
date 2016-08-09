class Personal::CheckoutsController < ApplicationController
  def process_payment
    @enrollment = current_user.enrollments.new(course_id: params[:course_id],
                                               join_date: params[:join_date],
                                               paid_points: params[:paid_points])
    add_payable_option
    @payment_service = PaymentService.new(current_user)
    if @enrollment.save
      @payment = @payment_service.save_payment_info(params, @enrollment)
      # check third party payments service
      if @payment
        flash[:error] = @payment.error
        redirect_to :back
      else
        @payment_service.update_customer_info(params)
        flash[:success] = t('personal.checkouts.checkout_success')
        feedback
        redirect_to confirmation_personal_enrollments_path(course_id: params[:course_id])
      end
    else
      flash[:error] = @enrollment.errors.full_messages[0]
      redirect_to :back
    end
  end

  private

  # add payable option to enrollment
  def add_payable_option
    if params[:payable_option].present?
      params[:payable_option].each do |option_id|
        @enrollment.options << PayableOption.find(option_id)
      end
    end
  end
  # feedback from customer
  def feedback
    @course = Course.find(params[:course_id])
    if params[:message_fb].present?
      @course.feedback(current_user, params[:message_fb]) 
      flash[:success] << 'Feedback successful!!'
    end
  end
end
