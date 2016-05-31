class Teacher < ActiveRecord::Base
  has_many :courses
  has_many :contracts, dependent: :destroy
  has_many :studios, through: :contracts

  validates :name, presence: true, uniqueness: true
  def name_with_initial
    self.name
  end
end
