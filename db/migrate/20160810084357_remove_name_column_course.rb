class RemoveNameColumnCourse < ActiveRecord::Migration
  def change
  	remove_column :courses, :name, :string
  	add_column :courses, :course_type_id, :integer
  end
end
