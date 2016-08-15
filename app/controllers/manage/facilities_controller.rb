class Manage::FacilitiesController < Manage::BaseController
  def index
    @facilities = @studio.facility
  end

  def update
    if @studio.update_attributes(facility: params[:facilities] || [])
      set_flash_message :success, :updated
    else
      set_flash_message :error, :error
    end
    redirect_to manage_facilities_path
  end
end
