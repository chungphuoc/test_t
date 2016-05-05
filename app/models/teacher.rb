class Teacher < ActiveRecord::Base
  has_many :courses
  has_many :contracts, dependent: :destroy
  has_many :studio, through: :contracts

  validates :name, presence: true, uniqueness: true
end
