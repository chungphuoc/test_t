class RenameTableFavouriteClass < ActiveRecord::Migration
  def change
    rename_table :favourite_classes, :favourite_courses
  end
end
