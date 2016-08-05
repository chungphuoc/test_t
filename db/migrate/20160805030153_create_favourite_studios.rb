class CreateFavouriteStudios < ActiveRecord::Migration
  def change
    create_table :favourite_studios do |t|
    	t.belongs_to :studio
    	t.belongs_to :customer
      t.timestamps null: false
    end
  end
end
