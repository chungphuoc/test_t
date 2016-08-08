class BackgroundImage < ActiveRecord::Base
  enum img_type: [:home_page, :other_page]
  mount_uploader :url, ImageUploader

  def self.image_homepage
    BackgroundImage.where(img_type: BackgroundImage.img_types[:home_page]).take
  end

  def self.create_default
    BackgroundImage.create_homepage
    BackgroundImage.create(
      url: File.open("#{Rails.root}/app/assets/images/yoga.jpg"),
      img_type: BackgroundImage.img_types[:other_page]
    )
  end

  def self.create_homepage
    BackgroundImage.create(
      url: File.open("#{Rails.root}/app/assets/images/yoga.jpg"),
      img_type: BackgroundImage.img_types[:home_page]
    )
  end
end
