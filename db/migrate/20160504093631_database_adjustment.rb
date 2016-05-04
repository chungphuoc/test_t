class DatabaseAdjustment < ActiveRecord::Migration
  def change
    drop_table :exercise_studios
    drop_table :station_studios
    add_column :courses, :teacher_id, :integer
    add_column :courses, :station_id, :integer
    add_column :courses, :studio_id, :integer
    add_column :courses, :exercise_id, :integer
    rename_column :customer_courses, :studio_id, :course_id
  end
end
