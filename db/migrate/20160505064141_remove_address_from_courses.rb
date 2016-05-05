class RemoveAddressFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :address, :tring
    rename_column :courses, :start_day, :start_date
  end
end
