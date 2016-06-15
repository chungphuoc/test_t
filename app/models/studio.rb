class Studio < ActiveRecord::Base
  has_one :user, as: :role, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :contracts, dependent: :destroy
  has_many :teachers, through: :contracts
  has_many :branches, dependent: :destroy
  has_many :stations, through: :branches
  has_many :services, dependent: :destroy
  has_many :exercises, through: :services
  has_many :enrollments, through: :courses
  has_many :requested_stations, class_name: 'Station', foreign_key: :requester_id

  delegate :email, :address, :contact_number, :avatar, :name, to: :user

  accepts_nested_attributes_for :user

  mount_uploader :cover_img, ImageUploader

  def name_with_initial
    name
  end
end
