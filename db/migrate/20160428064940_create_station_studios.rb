class CreateStationStudios < ActiveRecord::Migration
  def change
    create_table :station_studios do |t|
      t.references :station, index: true, foreign_key: true
      t.references :studio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
