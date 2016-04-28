class StationStudio < ActiveRecord::Base
  belongs_to :station
  belongs_to :studio
end
