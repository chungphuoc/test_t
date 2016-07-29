class BackgroundImage < ActiveRecord::Base
  enum img_type: [:home_page, :other_page]
  mount_uploader :url, ImageUploader

  def self.get_image_homepage
    BackgroundImage.where(img_type: BackgroundImage.img_types[:home_page]).take
  end
end
