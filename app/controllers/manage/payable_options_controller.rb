class Manage::PayableOptionsController < Manage::BaseController
  def index
    @payable_option = PayableOption.new
  end

  def create
    @payable_option = PayableOption.new(payable_option_params)
    if @payable_option.save
      set_flash_message :success, :created
      redirect_to manage_payable_options_path
    else
      render :index
    end
  end

  def destroy
    option = @studio.options.find(params[:id])
    if option.destroy
      set_flash_message :success, :destroyed
    else
      set_flash_message :error, :destroy_failed
    end
    redirect_to manage_payable_options_path
  end

  private

  def payable_option_params
    params.require(:payable_option).permit(:name, :price).merge(studio_id: @studio.id)
  end
end
