class RemoveColumnCourse < ActiveRecord::Migration
  def change
  	remove_column :courses, :website, :string
  	remove_column :courses, :phone_number, :string
  end
end
