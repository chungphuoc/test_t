class Admin::BackgroundImagesController < Admin::BaseController
  def index
    @images = BackgroundImage.all
  end

  def update
    new_image = image_params
    if new_image
      @images = BackgroundImage.all
      @img = BackgroundImage.find(params[:id])
      @img.url = image_params[:url]
      @img.save
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
