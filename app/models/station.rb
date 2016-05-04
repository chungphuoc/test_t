class Station < ActiveRecord::Base
  has_many :courses
  has_many :branches, dependent: :destroy
  has_many :studios, through: :branches
end
