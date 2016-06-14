class PaymentService
  def initialize(user)
    @user = user
    @customer = user.role
  end

  def save_payment_info(params)
    customer = Stripe::Customer.create(email: params[:stripeEmail],
                                       card: params[:stripeToken])
    charge = Stripe::Charge.create(customer: customer.id,
                                   amount: params[:tuition].to_i * 100,
                                   description: params[:course_name] + ', ' + params[:studio_name],
                                   currency: params[:currency])
  end

  def update_customer_info(params)
    new_point = (params[:tuition].to_i / 100).round
    @customer.increment(:total_point, new_point)
    @customer.increment(:point, new_point)
    @customer.save
  end
end
