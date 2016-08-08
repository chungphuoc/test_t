class FavouriteStudio < ActiveRecord::Base
	validates_uniqueness_of :customer_id, scope: [:studio_id]
  belongs_to :customer
  belongs_to :studio

  delegate :name, to: :studio, prefix: true
  delegate :name, to: :customer, prefix: true 

  def self.added?(current_user, studio_id)
    current_user.favourite_studios.exists?(studio_id: studio_id)
  end
end
