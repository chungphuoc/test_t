class Personal::CheckoutsController < ApplicationController
  def process_payment
    customer = Stripe::Customer.create(email: params[:stripeEmail],
                                       card: params[:stripeToken])
    charge = Stripe::Charge.create(customer: customer.id,
                          amount: params[:tuition].to_i * 100,
                          description: params[:course_name],
                          currency: params[:currency])
    if charge
      byebug
      @customer = current_user.role
      @course = Course.find(params[:course_id])
      @enrollment = Enrollment.by_customer_and_course(@customer, @course)
      @enrollment.change_status(Enrollment::STATUS_PAID)
      new_point = point = @customer.total_point + (params[:tuition].to_i/100).round
      @customer.update_attributes(total_point: new_point)
      if new_point > Customer::LOYALTY_POINT
        @customer.update_attributes(customer_type: Customer::LOYALTY_CUSTOMER)
      end
      @customer.increment(:total_attended, Course::MAX_ATTENDED)
      @customer.increment(:calo_burnt, @course.kcal)
    end
    redirect_to :back
  end
end
