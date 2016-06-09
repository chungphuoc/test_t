class Admin::ServicesController < Admin::BaseController
  before_action :prepare_studio

  def index
    @services = @studio.services.page(params[:page])
  end

  def create
    @service = @studio.services.new(exercise_id: params[:service][:exercise_id])
    if @service.save
      set_flash_message :success, :created
    else
      flash[:error] = @service.errors[:exercise_id].to_sentence
    end
    redirect_to :back
  end

  def destroy
    @service = Service.find(params[:id])
    if @service.destroy
      set_flash_message :success, :destroyed
    else
      set_flash_message :error, :destroy_failed
    end
    redirect_to :back
  end

  private

  def prepare_studio
    @studio = Studio.find(params[:studio_id])
  end
end
