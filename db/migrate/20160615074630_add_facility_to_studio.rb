class AddFacilityToStudio < ActiveRecord::Migration
  def change
    add_column :studios, :facility, :integer, array: true, default: '{}'
  end
end
