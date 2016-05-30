class AddFullDatesToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :full_dates, :date, array: true, default: '{}'
    add_index :courses, :full_dates, using: 'gin'
  end
end
