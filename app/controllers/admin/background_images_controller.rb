class Admin::BackgroundImagesController < Admin::BaseController
  before_action :create_homepage_background, only: [:index]

  def index
    @images = BackgroundImage.all
  end

  def update
    new_image = image_params
    if new_image.empty?
      set_flash_message(:error, :update_failed)
    else
      @img = BackgroundImage.find(params[:id])
      @img.update_attributes(url: new_image[:url])
      set_flash_message(:success, :updated)
    end
    redirect_to admin_background_images_path
  end

  private

  def image_params
    params.require(:background_image).permit(:url)
  end

  def create_homepage_background
    home_page_image = BackgroundImage.find_by(img_type: BackgroundImage.img_types[:home_page])
    home_page_image || BackgroundImage.create_homepage
  end
end
