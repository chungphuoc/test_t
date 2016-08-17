class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  layout 'devise'

  # GET /resource/sign_up
  def new
    @term = Term.first
    super
  end

  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.provider = params[:provider] if params[:provider].present?
    resource.uid = params[:uid] if params[:uid].present?
    begin
      ActiveRecord::Base.transaction do
        if params[:user_type] == 'customer'
          @customer = Customer.new
          resource.role = @customer
          @customer.save!
        else
          @studio = Studio.new
          resource.role = @studio
          @studio.save!
        end
        resource.save!
      end
    rescue Exception => e
    end
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def destroy
    super
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :name << :email << :password << :password_confirmation << :provider << :uid
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :password << :password_confirmation
  end

  private

  def registration_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  protected

  # The path used after sign up but inactive.
  def after_inactive_sign_up_path_for
    welcome_static_pages_path
  end
end
