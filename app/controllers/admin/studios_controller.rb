class Admin::StudiosController < Admin::BaseController
  before_action :prepare_studio, only: [:show, :update, :edit, :destroy]

  def index
    @studios = Studio.all.page(params[:page])
  end

  def show
  end

  def new
    @studio = Studio.new
    @studio.build_user
  end

  def edit
  end

  def create
    @studio = Studio.new(studio_params)
    if @studio.save
      set_flash_message :success, :created
      redirect_to admin_studios_path
    else
      set_flash_message :error, :error, scope: :error, now: true
      render :new
    end
  end

  def update
    if @studio.update_attributes(studio_params)
      set_flash_message :success, :updated
      redirect_to admin_studios_path
    else
      set_flash_message :error, :error, scope: :error, now: true
      render :edit
    end
  end

  def destroy
    if @studio.destroy
      set_flash_message :success, :destroyed
    else
      set_flash_message :error, :destroy_failed
    end
    redirect_to :back
  end

  private

  def prepare_studio
    @studio = Studio.find(params[:id])
  end

  def studio_params
    if params[:studio][:user_attributes][:password].blank? && params[:studio][:user_attributes][:password_confirmation].blank?
      params[:studio][:user_attributes].delete(:password)
      params[:studio][:user_attributes].delete(:password_confirmation)
    end
    params[:studio][:user_attributes].delete(:address) if params[:studio][:user_attributes][:address].blank?
    params[:studio][:user_attributes].delete(:contact_number) if params[:studio][:user_attributes][:contact_number].blank?
    params.require(:studio).permit(:cover_img, user_attributes: [:id, :name, :email, :contact_number, :password, :password_confirmation, :address, :avatar])
  end
end
