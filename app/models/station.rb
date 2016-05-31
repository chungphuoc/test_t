class Station < ActiveRecord::Base
  has_many :courses
  has_many :branches, dependent: :destroy
  has_many :studios, through: :branches

  validates :location, presence: true, uniqueness: true
  def name_with_initial
    self.name
  end
end
