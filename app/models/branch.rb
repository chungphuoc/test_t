class Branch < ActiveRecord::Base
  belongs_to :studio
  belongs_to :station

  validates :min_walk, numericality: { greater_than_or_equal_to: 0 }
  validates_uniqueness_of :station_id, scope: [:studio_id], message: 'Station has already been added.'

  delegate :name, to: :station

  def _min_walk
    min_walk.to_s + ' min'
  end
end
