class Branch < ActiveRecord::Base
  belongs_to :studio
  belongs_to :station

  validates_uniqueness_of :station_id, scope: [:studio_id], message: 'Station has already been added.'
end
