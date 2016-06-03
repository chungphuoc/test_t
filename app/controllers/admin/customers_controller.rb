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
      set_flash_message :success, :updated
      redirect_to admin_customers_path
    else
      set_flash_message :error, :error, scope: :error, now: true
      render :edit
    end
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      set_flash_message :success, :created
      redirect_to admin_customers_path
    else
      set_flash_message :error, :error, scope: :error, now: true
      render :new
    end
  end

  def destroy
    if @customer.destroy
      set_flash_message :success, :destroyed
    else
      set_flash_message :error, :destroy_failed
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
