class Station < ActiveRecord::Base
  enum status: [:approved, :requested, :rejected]
  has_many :courses
  has_many :branches, dependent: :destroy
  has_many :studios, through: :branches
  has_many :translations
  belongs_to :requester, class_name: 'Studio'

  validates :location, presence: true, uniqueness: true
  #validates :name, presence: true, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  accepts_nested_attributes_for :translations
  translates :name, :string

  class Translation
    validates :name, presence: true
  end

  def name_with_initial
    name
  end
end
