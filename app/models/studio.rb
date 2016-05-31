class Studio < ActiveRecord::Base
  has_one :user, as: :role, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :contracts, dependent: :destroy
  has_many :teachers, through: :contracts
  has_many :branches, dependent: :destroy
  has_many :stations, through: :branches
  has_many :services, dependent: :destroy
  has_many :exercises, through: :services
  has_many :requested_stations, class_name: 'Station', foreign_key: :requester_id

  delegate :email, to: :user
  delegate :name, to: :user
  delegate :address, to: :user
  delegate :contact_number, to: :user
  delegate :avatar, to: :user
  accepts_nested_attributes_for :user

  mount_uploader :cover_img, ImageUploader

  def name_with_initial
    self.name
  end
end
