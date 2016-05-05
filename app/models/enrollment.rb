class Enrollment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :course
end
