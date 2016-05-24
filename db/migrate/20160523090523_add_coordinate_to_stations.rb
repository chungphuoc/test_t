class AddCoordinateToStations < ActiveRecord::Migration
  def change
    add_column :stations, :latitude, :float, default: 0
    add_column :stations, :longitude, :float, default: 0
  end
end
