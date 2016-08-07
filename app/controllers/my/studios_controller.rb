class My::StudiosController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_studio!
  before_action :prepare_studio
  layout 'account'

  def show
  end

  def edit
    @type = params[:type]
  end

  def update
    @studio.user.update_attributes(user_params)
    if @studio.update_attributes(studio_params.merge(facility: params[:facilities] || []))
      set_flash_message :success, :updated
      redirect_to edit_my_studio_path
    else
      set_flash_message :error, :error, scope: :error, now: true
      render :edit
    end
  end

  def add_teacher
    contract = @studio.contracts.new(teacher_attributes: { name: params[:name] })
    if contract.save
      render 'teacher_box', layout: false
    else
      render json: { error: contract.errors.full_messages }
    end
  end

  def add_payable_option
    option = @studio.options.new(
      name: payable_option_params[:option_name],
      price: payable_option_params[:option_price]
    )
    if option.save
      set_flash_message :success, :updated
    else
      set_flash_message :error, :error, scope: :error
    end
    redirect_to my_studio_path
  end

  def remove_payable_option
    option = @studio.options.find(params[:id])
    flash[:error] = option.errors.full_messages.join(', ') unless option.delete
    redirect_to my_studio_path
  end

  private

  def authenticate_studio!
    return if current_user.studio?
    set_flash_message :notice, :access_denied, scope: :error
    redirect_to root_path
  end

  def prepare_studio
    @studio = current_user.role
  end

  def studio_params
    params.require(:studio).permit(
      :cover_img,
      :website,
      :description,
      :bank_name,
      :account_number,
      :account_owner
    )
  end

  def user_params
    params.require(:studio).require(:user_attributes).permit(:name, :contact_number, :address, :avatar)
  end

  def payable_option_params
    params.permit(:option_name, :option_price)
  end

  def translation_scope
    "my.#{controller_name}"
  end
end
