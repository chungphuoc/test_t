class Admin::StudiosController < Admin::BaseController
  before_action :prepare_studio, only: [:show, :update, :edit, :destroy]

  def index
    @studios = Studio.all
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
      flash[:success] = 'Successful create Studio.'
      redirect_to admin_studios_path
    else
      flash[:error] = 'Cannot create Studio'
      render :new
    end
  end

  def update
    if @studio.update_attributes(studio_params)
      flash[:success] = 'Successful update Studio.'
      redirect_to admin_studios_path
    else
      flash[:error] = 'Cannot update Studio'
      render :edit
    end
  end

  def destroy
    if @studio.destroy
      flash[:success] = 'Delete Studio successful!'
    else
      flash[:error] = 'Cannot delete Studio!'
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
