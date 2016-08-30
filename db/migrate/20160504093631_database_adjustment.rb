class DatabaseAdjustment < ActiveRecord::Migration
  def change
    drop_table :exercise_studios
    drop_table :station_studios
    add_column :courses, :teacher_id, :integer
    # add_column :courses, :station_id, :integer
    add_column :courses, :studio_id, :integer
    add_column :courses, :exercise_id, :integer
    #rename_column :customer_courses, :studio_id, :course_id
    remove_reference :customer_courses, :studio, index: true
    #remove_foreign_key :customer_courses, :studio
    add_reference :customer_courses, :course, index: true
    #add_foreign_key :customer_courses, :course
  end
end
