class AddStatusAndRequesterToStations < ActiveRecord::Migration
  def change
    add_column :stations, :status, :integer
    add_column :stations, :requester_id, :integer
  end
end
