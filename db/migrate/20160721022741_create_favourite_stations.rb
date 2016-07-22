class CreateFavouriteStations < ActiveRecord::Migration
  def change
    create_table :favourite_stations do |t|
      t.references :customer
      t.references :station

      t.timestamps null: false
    end
  end
end
