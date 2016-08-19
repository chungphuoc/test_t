class PaymentService
  def initialize(user)
    @user = user
    @customer = user.role
  end

  def save_payment_info(params, enrollment)
    byebug
    customer = Stripe::Customer.create(email: @user.email,
                                       source: params[:source])
    begin
    charge = Stripe::Charge.create(customer: customer.id,
                                   amount: enrollment.total_cost,
                                   description: params[:course_name] + ', ' + params[:studio_name],
                                   currency: enrollment.course.currency)
    rescue Stripe::CardError => e
      body = e.json_body
      err  = body[:error]
      return { error: err[:message] }
    end
    # check correct payment
    if charge.amount != enrollment.total_cost
      return { error: 'Have problems in your payment' }
    else
      return nil
    end
  end

  def update_customer_info(params)
    new_point = (params[:tuition].to_i / 100).round
    @customer.increment(:total_point, new_point)
    @customer.increment(:point, new_point)
    @customer.save
  end
end
