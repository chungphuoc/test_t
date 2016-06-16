class My::StudiosController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_studio!
  before_action :prepare_studio
  layout 'account'

  def show
  end

  def edit
  end

  def update
    @studio.user.update_attributes(user_params)
    if @studio.update_attributes(studio_params)
      set_flash_message :success, :updated
      redirect_to my_studio_path
    else
      set_flash_message :error, :error, scope: :error, now: true
      render :edit
    end
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
    params.require(:studio).permit(:cover_img)
  end

  def user_params
    params.require(:studio).require(:user_attributes).permit(:name, :contact_number, :address, :avatar)
  end

  def translation_scope
    "my.#{controller_name}"
  end
end
