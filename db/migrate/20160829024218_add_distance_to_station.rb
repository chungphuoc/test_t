class AddDistanceToStation < ActiveRecord::Migration
  def change
    add_column :branches, :min_walk, :integer, default: 0
  end
end
