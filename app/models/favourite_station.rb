class FavouriteStation < ActiveRecord::Base
  validates_uniqueness_of :customer_id, scope: [:station_id]
  belongs_to :customer
  belongs_to :station

  def self.added?(current_user, station_id)
    current_user.favourite_stations.exists?(station_id: station_id)
  end
end
