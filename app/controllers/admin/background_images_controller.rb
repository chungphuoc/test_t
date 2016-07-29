class Admin::BackgroundImagesController < Admin::BaseController
  def index
    @images = BackgroundImage.all
  end

  def update
    new_image = image_params
    if new_image
      @img = BackgroundImage.find(params[:id])
      @img.update_attributes(url: new_image[:url])
      redirect_to admin_background_images_path
    else
      render 'index'
    end
  end

  private

  def image_params
    params.require(:background_image).permit(:url)
  end
end
