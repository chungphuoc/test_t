class Manage::PayableOptionsController < Manage::BaseController
  def index
    @payable_option = PayableOption.new
  end

  def create
    @payable_option = PayableOption.new(payable_option_params)
    if @payable_option.save
      set_flash_message :success, :create
      redirect_to manage_payable_options_path
    else
      render :index
    end
  end

  private

  def payable_option_params
    params.require(:payable_option).permit(:name, :price).merge(studio_id: @studio.id)
  end
end
