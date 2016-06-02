class Exercise < ActiveRecord::Base
  has_many :courses
  has_many :services, dependent: :destroy
  has_many :studios, through: :services

  validates_uniqueness_of :station_id, scope: [:studio_id], message: 'Station has already been added.'
  validates :name, presence: true, uniqueness: true
  def name_with_initial
    name
  end
end
