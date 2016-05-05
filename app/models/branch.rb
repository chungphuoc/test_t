class Branch < ActiveRecord::Base
  belongs_to :studio
  belongs_to :station
end
