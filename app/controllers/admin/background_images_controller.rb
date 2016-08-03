class Admin::BackgroundImagesController < Admin::BaseController
  before_action :create_homepage_background, only: [:index]

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

  def create_homepage_background
    home_page_image = BackgroundImage.find_by(img_type: BackgroundImage.img_types[:home_page])
    if home_page_image.nil?
      BackgroundImage.create_homepage
    end
  end
end
