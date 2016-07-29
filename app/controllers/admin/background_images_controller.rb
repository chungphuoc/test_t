class Admin::BackgroundImagesController < Admin::BaseController
  def index
    @images = BackgroundImage.all
  end

  def update
    # render plain: image_params
    @images = BackgroundImage.all
    @img = BackgroundImage.find(params[:id])
    @img.url = image_params[:url]
    @img.save

    redirect_to admin_background_images_path
  end

  private

  def image_params
    params.require(:background_image).permit(:url)
  end
end
