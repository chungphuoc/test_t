class Service < ActiveRecord::Base
  belongs_to :studio
  belongs_to :exercise
end
