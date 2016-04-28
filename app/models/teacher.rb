class Teacher < ActiveRecord::Base
  belongs_to :studio
  has_many :courses
end
