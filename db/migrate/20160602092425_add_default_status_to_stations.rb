class AddDefaultStatusToStations < ActiveRecord::Migration
  def change
    change_column_default :stations, :status, 0
  end
end
