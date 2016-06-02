class Admin::ServicesController < Admin::BaseController
  before_action :prepare_studio

  def index
    @services = @studio.services
  end

  def create
    @service = @studio.services.new(exercise_id: params[:service][:exercise_id])
    if @service.save
      flash[:success] = 'Add Station successful!'
    else
      flash[:error] = @service.errors[:exercise_id].to_sentence
    end
    redirect_to :back
  end

  def destroy
    @service = Service.find(params[:id])
    if @service.destroy
      flash[:success] = 'Delete exercise successful!'
    else
      flash[:error] = 'Can not delete exercise!'
    end
    redirect_to :back
  end

  private

  def prepare_studio
    @studio = Studio.find(params[:studio_id])
  end
end
