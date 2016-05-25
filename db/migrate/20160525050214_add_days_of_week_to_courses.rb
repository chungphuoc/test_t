class AddDaysOfWeekToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :days_of_week, :integer, array: true, default: '{}'
    add_index :courses, :days_of_week, using: 'gin'
  end
end
