class Station < ActiveRecord::Base
  enum status: [:requested, :approved]
  has_many :courses
  has_many :branches, dependent: :destroy
  has_many :studios, through: :branches
  belongs_to :requester, class_name: 'Studio'

  validates :location, presence: true, uniqueness: true
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  def name_with_initial
    self.name
  end
end
