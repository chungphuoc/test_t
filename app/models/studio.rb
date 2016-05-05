class Studio < ActiveRecord::Base
  has_one :user, as: :role
  has_many :courses, dependent: :destroy
  has_many :contracts, dependent: :destroy
  has_many :teachers, through: :contracts
  has_many :branches, dependent: :destroy
  has_many :stations, through: :branches
  has_many :services, dependent: :destroy
  has_many :exercises, through: :services
  accepts_nested_attributes_for :user
end
