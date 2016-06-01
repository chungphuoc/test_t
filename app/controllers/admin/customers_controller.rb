class Admin::CustomersController < Admin::BaseController
  before_action :prepare_studio, only: [:show, :update, :destroy, :edit]

  def new
    @customer = Customer.new
    @customer.build_user
  end

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
    if @customer.update_attributes(customer_params)
      flash[:notice] = 'Successful update Customer.'
      redirect_to admin_customers_path
    else
      flash[:notice] = 'Cannot update Customer'
      render :edit
    end
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = 'Successful create Studio.'
      redirect_to admin_customers_path
    else
      flash[:notice] = 'Cannot create Studio'
      render :new
    end
  end

  def destroy
    flash[:notice] = if @customer.destroy
                       'Delete Customer successful!'
                     else
                       'Cannot delete Customer!'
                     end
    redirect_to :back
  end

  private

  def prepare_studio
    @customer = Customer.find(params[:id])
  end

  def customer_params
    if params[:customer][:user_attributes][:password].blank? && params[:customer][:user_attributes][:password_confirmation].blank?
      params[:customer][:user_attributes].delete(:password)
      params[:customer][:user_attributes].delete(:password_confirmation)
    end
    params[:customer][:user_attributes].delete(:address) if params[:customer][:user_attributes][:address].blank?
    params[:customer][:user_attributes].delete(:contact_number) if params[:customer][:user_attributes][:contact_number].blank?
    params.require(:customer).permit(:point, :gender, :birthday, :receive_sms, :total_point, user_attributes: [:id, :name, :email, :contact_number, :password, :password_confirmation, :address, :avatar])
  end
end
