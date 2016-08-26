class Station < ActiveRecord::Base
  enum status: [:approved, :requested, :rejected]
  has_many :course_stations
  has_many :courses, through: :course_stations
  has_many :branches, dependent: :destroy
  has_many :studios, through: :branches
  has_many :translations
  belongs_to :requester, class_name: 'Studio'

  validates :location, presence: true, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  accepts_nested_attributes_for :translations
  translates :name, :string

  class Translation
    validates :name, presence: true
    validates_uniqueness_of :station_id, scope: [:locale]
  end

  def name_with_initial
    name
  end
end
